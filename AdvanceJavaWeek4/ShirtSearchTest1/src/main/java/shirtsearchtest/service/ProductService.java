package shirtsearchtest.service;

import java.io.BufferedReader;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shirtsearchtest.dao.ProductDao;
import shirtsearchtest.dao.UserDao;
import shirtsearchtest.model.Product;
import shirtsearchtest.model.User;

@Service
public class ProductService {

	@Autowired
	private ProductDao productDao;
	@Autowired
	private UserDao userDao;
	private static final String SKIP_ROW = "ID";
	private static final String AVAILABILITY = "Y";

	// this method add tshirt entries into databases.
	public void addProductEntries() {
		try {
			File directoryPath = new File("C:\\Assignment\\Advance Java\\Assigment Links");
			File fileslist[] = directoryPath.listFiles();
			String l = null;
			for (File file : fileslist) {
				BufferedReader reader = Files.newBufferedReader(Paths.get(file.getAbsolutePath()));
				while ((l = reader.readLine()) != null) {
					String productdetails[] = l.split("\\|");
					if (productdetails[0].equals(SKIP_ROW))
						continue;
					Product product=new Product();

					product.setId(productdetails[0]);
					product.setName(productdetails[1]);
					product.setColour(productdetails[2]);
					product.setGender(productdetails[3]);
					product.setSize(productdetails[4]);
					product.setPrice(Float.parseFloat(productdetails[5]));
					product.setRating(Float.parseFloat(productdetails[6]));
					product.setAvailability(productdetails[7]);
					int id = this.createProduct(product);
					System.out.println(id);

				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
	public void addUserEntries(User user)
	{
		try 
		{
			int id=this.register(user);
			System.out.println(id);
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	public int createProduct(Product product) 
	{
		int id = this.productDao.addProduct(product);
		return id;
	}
	public int register(User user)
	{
		int id=this.userDao.addUser(user);
		return id;
		
	}
	// this method return all available tshirts
	public List<Product> getAllAvailableProducts(String clr, String gndr, String sze,String outpref) 
			throws ParseException 
	{
		List<Product> totalproducts=productDao.getAllProducts();
		List<Product> actualproducts=new ArrayList<Product>();

		for (Product product:totalproducts) 
		{
			boolean colour = product.getColour().equals(clr);
			boolean gender = product.getGender().equals(gndr);
			boolean productAvail = product.getAvailability().equals(AVAILABILITY);
			boolean size = product.getSize().equals(sze);

			if (colour && gender && productAvail && size)
				actualproducts.add(product);
		}

		
		if (Integer.parseInt(outpref) == 1) 
		{

			
			
			Collections.sort(actualproducts, new Comparator<Product>() {
				public int compare(Product o1, Product o2) {
			return (int) (o1.getPrice() - o2.getPrice());
				}
			});
	} 
	else 
		{

		
		Collections.sort(actualproducts, new Comparator<Product>() {
			public int compare(Product o1, Product o2) {
		if (o1.getRating() > o2.getRating()) {
			return -1;
		}
		if (o1.getRating() < o2.getRating()) {
			return 1;
		}
		return 0;
			}

		});
		
		}

	
		return actualproducts;
	}
	
}