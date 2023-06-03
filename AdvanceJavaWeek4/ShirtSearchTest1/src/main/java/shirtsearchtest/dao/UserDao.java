package shirtsearchtest.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import shirtsearchtest.model.User;

@Repository
public class UserDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	private SessionFactory factory;

	public UserDao(SessionFactory factory)
	{
		super();
		this.factory = factory;
	}
	@Transactional
	public int addUser(User user) 
	{
		int id = (Integer) this.hibernateTemplate.save(user);
		return id;
	}
	
	//get all products
	public List<User> getAllUsers() 
	{
		// TODO Auto-generated method stub
		List<User> products=this.hibernateTemplate.loadAll(User.class);
		return products;
	}
	
	public User getUserByNameAndPassword(String username,String password)
	{
		User user=null;
		try {
			String query="from User where userName =: n and userPassword=: p";
			Session session=this.factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("n", username);
			q.setParameter("p", password);
		
			user=(User) q.uniqueResult();
			session.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
	}
	
	@SuppressWarnings({"unchecked","deprecation"})
	public boolean findUser(String username)
	{
		boolean isValidUser=false;
		//String sqlQuery="from User u where u.userName=?1";
		try {
			List userObj=(List)hibernateTemplate.find("from User u where u.userName=?0", username);
			if(userObj!=null && userObj.size()>0)
			{
				isValidUser=true;
			}
		}catch(Exception e)
		{
			isValidUser=false;
			System.out.println(e);
		}
		return isValidUser;
	}
}
