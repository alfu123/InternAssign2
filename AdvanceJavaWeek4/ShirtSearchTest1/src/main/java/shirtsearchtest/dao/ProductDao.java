package shirtsearchtest.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shirtsearchtest.model.Product;

@Repository
public class ProductDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int addProduct(Product product) 
	{
		int id = (Integer) this.hibernateTemplate.save(product);
		return id;
	}
	
	//get all products
	public List<Product> getAllProducts() 
	{
		// TODO Auto-generated method stub
		List<Product> products=this.hibernateTemplate.loadAll(Product.class);
		return products;
	}
}
