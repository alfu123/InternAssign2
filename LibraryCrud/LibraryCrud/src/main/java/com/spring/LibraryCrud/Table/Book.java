package com.spring.LibraryCrud.Table;



import org.springframework.stereotype.Component;

@Component
public class Book {
	
	private String bookcode;
	private String bookname;
	private String author;
	private String date;

	public String getBookcode() {
		return bookcode;
	}

	public void setBookcode(String bookcode) {
		this.bookcode = bookcode;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Book(String bookcode, String bookname, String author, String date) {
		super();
		this.bookcode = bookcode;
		this.bookname = bookname;
		this.author = author;
		this.date = date;

	}

	@Override
	public String toString() {
		return "Book [bookcode=" + bookcode + ", bookname=" + bookname + ", author=" + author + ", date=" + date + "]";
	}

	public Book() {
		super();
	}

}
