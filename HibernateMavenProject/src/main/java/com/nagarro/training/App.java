package com.nagarro.training;

import org.hibernate.cfg.Configuration;
import com.opencsv.exceptions.CsvException;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



public class App {
	public static void main(String[] args) throws IOException, CsvException {

		csvController.loadData();
		String ch;
		do {

			Scanner sc = new Scanner(System.in);
			System.out.println("Enter the color:");
			String color = sc.nextLine().toUpperCase();
			System.out.println("Enter the size:");
			String size1 = sc.nextLine().toUpperCase();
			System.out.println("Enter the gender:");
			String gender = sc.nextLine();
//			System.out.println("Enter the output preference:");
//			double output_preference = sc.nextDouble();
			
			Configuration cfg=new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory sf=cfg.buildSessionFactory();
			Session session=sf.openSession();
			Transaction tx=session.beginTransaction();
			String q="From Tshirt as T where T.colour=:userColor and T.size=:size1 "
					+ "and T.genderRecommendation=:gender ";
//					+ "and (T.price=:output_preference or T.rating=:output_preference)";
			Query query=session.createQuery(q);
			
			query.setParameter("userColor", color);
			query.setParameter("size1", size1);
			query.setParameter("gender", gender);
//			query.setParameter("output_preference", output_preference);
			List<Tshirt> result=query.list();
			for(Tshirt s:result) {
				System.out.println(s);
			}
			
			tx.commit();
			session.close();
			System.out.println("do you want to repeat this y/n");
			ch=sc.next();
		}
		while(ch.equalsIgnoreCase("y"));
	}
}