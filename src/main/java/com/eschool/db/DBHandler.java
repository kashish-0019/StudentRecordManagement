package com.eschool.db;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.eschool.entity.Student;

public class DBHandler {

	public void save(Student student)
	{
		try {
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
			Session session = sf.getCurrentSession();
			session.beginTransaction();
			session.persist(student);
			session.getTransaction().commit();
			
		}catch(Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
	}

	public void update(Student newStudent) {
		try {
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
			Session session = sf.getCurrentSession();
			session.beginTransaction();
			Student s = session.get(Student.class, newStudent.getId());
			s.setUsername(newStudent.getUsername());
			s.setEmail(newStudent.getEmail());
			s.setPassword(newStudent.getPassword());
			s.setGender(newStudent.getGender());
			s.setCity(newStudent.getCity());
			session.getTransaction().commit();
			
		}catch(Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
		
	}
	public void delete(int id) {
		try {
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
			Session session = sf.getCurrentSession();
			session.beginTransaction();
			Student s = session.get(Student.class, id);
			session.remove(s);
			session.getTransaction().commit();
			
		}catch(Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
	}

	public Student getStudent(int id) {
		Student s = null;
		try {
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
			Session session = sf.getCurrentSession();
			session.beginTransaction();
			s = session.get(Student.class, id);
			session.getTransaction().commit();
			
		}catch(Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
		return s;
	}
}
