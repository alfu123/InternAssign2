package com.spring.LibraryCrud.Table;



import org.springframework.stereotype.Component;

@Component
public class Author {
	
	private String author;

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Override
	public String toString() {
		return "Author [author=" + author + "]";
	}
	
	
}
