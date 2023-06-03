package com.nagarro.training;

import org.hibernate.cfg.Configuration;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;
import java.io.File;
import java.io.*;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class csvController {
	static List<String> filenames = new LinkedList<String>();

	public static void listFilesfolder(final File folder) {
		for (final File fileEntry : folder.listFiles()) {
			if (fileEntry.getName().contains(".csv")) {
				filenames.add(fileEntry.getName());

			}
		}
	}

	public static void loadData() throws IOException, CsvException {
		//configuration, session
		
		String str = "C:\\Users\\md-alfahadansari\\eclipse-workspace\\HibernateMavenProject\\src\\test\\resources\\";
		final File folder = new File(str);
		listFilesfolder(folder);
		for (String filename : filenames) {
			Reader reader = new FileReader(str + filename);
			//trans
			
			readCSV(reader);
			//tran commit
		}
	}

	public static List<Tshirt> readCSV(Reader reader) throws IOException, CsvException {
		List<Tshirt> tshirtList = new LinkedList<Tshirt>();
		CSVReader read=new CSVReader(reader);
		String[] xyz = read.readNext();
		xyz = read.readNext();
		while (xyz != null) {
			Tshirt tshirt = new Tshirt();
			tshirt.setId(xyz[0]);
			tshirt.setName(xyz[1]);
			tshirt.setColour(xyz[2]);
			tshirt.setGenderRecommendation(xyz[3]);
			tshirt.setSize(xyz[4]);
			tshirt.setPrice(Double.parseDouble(xyz[5]));
			tshirt.setRating(Double.parseDouble(xyz[6]));
			tshirt.setAvailability(xyz[7]);
			
			Configuration cfg=new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory sf=cfg.buildSessionFactory();
			Session session=sf.openSession();
			Transaction tx=session.beginTransaction();
			session.save(tshirt);
			tx.commit();
			session.close();
			tshirtList.add(tshirt);
			xyz = read.readNext();

		}
		reader.close();
		read.close();
		return tshirtList;
	}
}
