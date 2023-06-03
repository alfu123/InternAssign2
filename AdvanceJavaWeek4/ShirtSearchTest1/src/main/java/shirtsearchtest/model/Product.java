package shirtsearchtest.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Product_Details")
public class Product 
{	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int pid;
	@Column(name="PRODUCT_ID")
	private String id;
	@Column(name="PRODUCT_NAME")
	private String name;
	@Column(name="COLOUR")
	private String colour;
	@Column(name="GENDER_RECOMENDATION")
	private String gender;
	@Column(name="SIZE")
	private String size;
	@Column(name="PRICE")
	private float price;
	@Column(name="RATING")
	private float rating;
	@Column(name="PRODUCT_AVAILABILITY")
	private String availability;
	
	public Product() {
		super();
	}
	
	
	
	public Product(int pid, String id, String name, String colour, String gender, String size, float price,
			float rating, String availability) {
		super();
		this.pid = pid;
		this.id = id;
		this.name = name;
		this.colour = colour;
		this.gender = gender;
		this.size = size;
		this.price = price;
		this.rating = rating;
		this.availability = availability;
	}



	public int getPid() {
		return pid;
	}



	public void setPid(int pid) {
		this.pid = pid;
	}



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}
	
}
