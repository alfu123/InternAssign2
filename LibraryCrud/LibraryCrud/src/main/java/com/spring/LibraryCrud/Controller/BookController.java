package com.spring.LibraryCrud.Controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.spring.LibraryCrud.Table.Book;

@Controller
public class BookController {

	@Autowired
	private RestTemplate restTemplate;

	@PostMapping("/add_book")
	public String addbook(HttpServletRequest request) {
		request.getAttribute("uname");
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String formattedString = formatter.format(today);
		Book obj = new Book();
		obj.setBookcode(request.getParameter("bookcode"));
		obj.setBookname(request.getParameter("bookname"));
		obj.setAuthor(request.getParameter("author"));
		obj.setDate(formattedString);

		Map<String, String> param = new HashMap<>();
		param.put("bookcode", request.getParameter("bookcode"));

		Book b = restTemplate.getForObject("http://localhost:8082/book/{bookcode}", Book.class, param);

		if (b != null) {
			request.setAttribute("message", "Bookcode already exists");
			return "add";
		} else {
			ResponseEntity<Book> res = restTemplate.postForEntity("http://localhost:8082/add", obj, Book.class);
		}
		return "welcome";

	}

	@DeleteMapping("/Delete")
	public String deletebook(HttpServletRequest request) {

		Map<String, String> param = new HashMap<>();
		param.put("bookcode", request.getParameter("bookcode"));
		restTemplate.delete("http://localhost:8082/delete/{bookcode}", param);
		return "welcome";
	}
	
	
	@PutMapping("/edit")
	public String editbook(HttpServletRequest request) {
	HttpSession session = request.getSession();
	Book obj = new Book();
	obj.setBookcode(session.getAttribute("bookcode").toString());
	obj.setBookname(request.getParameter("bookname"));
	obj.setAuthor(request.getParameter("author"));
	obj.setDate(session.getAttribute("date").toString());
	
		ResponseEntity<Book> res=  restTemplate.postForEntity("http://localhost:8082/update", obj, Book.class);
		
		return "welcome";
	}

}
