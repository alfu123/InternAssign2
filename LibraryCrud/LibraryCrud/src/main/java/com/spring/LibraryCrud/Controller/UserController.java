package com.spring.LibraryCrud.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.spring.LibraryCrud.Table.UserDetails;

@Controller
public class UserController {

	private RestTemplate rest = new RestTemplate();

	@GetMapping("/")
	public String xyz() {
		return "index";
	}

	@GetMapping("/login")
	public String login(HttpServletRequest request) {
		
		String message;
		if (request.getParameter("uname") != "" && request.getParameter("pass") != "") {
			Map<String, String> param = new HashMap<>();
			param.put("username", request.getParameter("uname"));
			request.setAttribute("uname", request.getParameter("uname"));
			UserDetails user = rest.getForObject("http://localhost:8082/isvalid/{username}", UserDetails.class, param);

			if (user != null) {
				return "welcome";
			} else {
				message = "User doesn't exist.";
				request.setAttribute("errorMessage", message);
				return "index";
			}
		} else {
			message = "Username/Password cannot be blank.";
			request.setAttribute("errorMessage", message);
			return "index";
		}

	}

	@PostMapping("/signup")
	public String signup(HttpServletRequest request) {
		String message;
		if (request.getParameter("uname") != "" && request.getParameter("pass") != "")
		{
		UserDetails obj = new UserDetails();
		obj.setUsername(request.getParameter("uname"));
		obj.setPass(request.getParameter("pass"));
		request.setAttribute("username", request.getParameter("uname"));
		Map<String, String> param = new HashMap<>();
		param.put("username", request.getParameter("uname"));	
		UserDetails user1 = rest.getForObject("http://localhost:8082/isvalid/{username}", UserDetails.class, param);

		if (user1 != null) 
		{
			message = "User exist. Please login.";
			request.setAttribute("errorMessage", message);
			return "Signup";
		} 
		else 
		{
			request.setAttribute("uname", request.getParameter("uname"));
			ResponseEntity<UserDetails> user = rest.postForEntity("http://localhost:8082/addUser", obj, UserDetails.class);
			return "welcome";
		}
		}
		else {
			message = "Username/Password cannot be blank.";
			request.setAttribute("errorMessage", message);
			return "Signup";
		}
	
	}

	@GetMapping("/logout")
	public String logout(HttpServletResponse response) {
		return "index";
	}
}
