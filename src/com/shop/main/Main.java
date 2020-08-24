package com.shop.main;

import com.buyfy.controllers.CategoryController;
import com.buyfy.controllers.OrderController;
import com.buyfy.controllers.ProductController;
import com.buyfy.controllers.UserController;
import com.buyfy.dao.CategoryDAO;
import com.buyfy.dao.CategoryDAOImpl;
import com.buyfy.dao.FeedbackDAO;
import com.buyfy.dao.FeedbackDAOImpl;
import com.buyfy.dao.OrderDAO;
import com.buyfy.dao.OrderDAOImpl;
import com.buyfy.dao.ProductDAO;
import com.buyfy.dao.ProductDAOImpl;
import com.buyfy.dao.UserDAO;
import com.buyfy.dao.UserDAOImpl;
import com.buyfy.hibernate.util.HibernateUtil;
import com.buyfy.mail.Mail;
import com.buyfy.model.Address;
import com.buyfy.model.Cart;
import com.buyfy.model.Category;
import com.buyfy.model.Feedback;
import com.buyfy.model.Image;
import com.buyfy.model.Order;
import com.buyfy.model.Product;
import com.buyfy.model.ProductQuantity;
import com.buyfy.model.ProductReview;
import com.buyfy.model.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class Main {

	public void save() {
		// TODO Auto-generated method stub
		Set<Address> ad = new HashSet<>();
		Address a = new Address("moti bagh", "Delhi sarai", "delhi", "delhi", "110007", "India");
		ad.add(a);
//		boolean userCreated = UserController.save("Akshat", "Singh", "25-03-20", "root", "akshat@hcl.com", 
//				ad, 'm', new Image(), "9999988888", "admin");
//		Boolean userDeleted = UserController.delete(1);
//		if(userDeleted) {
//			System.out.println("Deleted------------------");
////		}else {
//			System.out.println("NOT CREATED------------------");
//		}
	}




	private static void getProd() {
//		Product p = ProductController.getProductById(1);
		Category cat = CategoryController.getCategoryById(1);
		System.out.println(cat);
		System.out.println("---");
//		Product p = ProductController.getProductById(2);
//		System.out.println(cat.getProducts());
		for (Product c : cat.getProducts()) {
			System.out.println(c.getId() + c.getName() + " " + " SIZE" + c.getReviews().size());
			for (ProductReview pr : c.getReviews()) {
				System.out.println(">>>" + pr);
			}
		}

	}

	public static void addReview() {
		long rid = 1;
		String review = "Priceless 4 times JENAS";
		long pid = 2;
		System.out.println("ADDES REVIEW " + ProductController.addReview(pid, review, rid));
	}

	public static void deleteProd() {
		long id = 2;
//		boolean b = ProductController.delete(id);
//		System.out.println("Is Deleted >");
	}

	public static void userExist() {
		String email = "akshat@gmail.com";
		User u = UserController.getUserByEmail(email);
		if (u != null) {
			System.out.println("true");
		} else {
			System.out.println("false");
		}
	}

	public static void gsonJson() {
		GsonBuilder gsonMapBuilder = new GsonBuilder();
		Gson gsonObject = gsonMapBuilder.create();
		Object obj[] = { 1, "As", "asd" };
		Object obj1[] = { 2, "asss", "sss" };
		Map<String, Object> map = new HashMap<>();
		map.put("Akshat1", obj);
		map.put("Aryan2", obj1);
		String str = gsonObject.toJson(map);
		System.out.println(str);
		Gson prettyGson = new GsonBuilder().setPrettyPrinting().create();
		String prettyJson = prettyGson.toJson(map);
		System.out.println(prettyJson);

	}

	public static User getUserById(long uid, Order order) {
		Transaction tx = null;
		SessionFactory factory = null;
		Session session = null;
		User user = null;
		try {
			factory = HibernateUtil.getSessionFactory();
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			user = (User) session.get(User.class, uid);
			System.out.println("----------------------------------------------------------");
			System.out.println(user);
			user.getOrders().add(order);
			tx.commit();
		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}

	public static void displayOrders() {
		List<User> users = UserController.getAllUsers();
		for (User u : users) {
			System.out.println("-----------USER!---------");
			for (Order o : u.getOrders()) {
				System.out.println(o);
			}
		}
	}

	public static void saveOrder() {
		Order order = new Order();
		User user = UserController.getUserById(22);
		System.out.println(user);
		System.out.println("-------order Saving -------");
		Set<ProductQuantity> qt = new HashSet<>();
		// Order Details
		order.setUser(user);
		order.setFirstName("SHARK");
		order.setLastName("icecream");
		order.setPhone("420420420");
		order.setAddress(new Address());
		order.setProducts(qt);
		order.setOrderDate(new Date());
		order.setOrderDelivered(false);
		order.setTransacStatus(false);
		order.setSalesTax(0);
		order.setAmount(9999);
		// Orders Set
		Set<Order> orders =  user.getOrders();
		orders.add(order);
		user.setOrders(orders); 

		System.out.println("-----------------------------");
		OrderDAO dao = new OrderDAOImpl();
		long i = dao.saveOrder(order);
//		System.out.println(user.getOrders());
		boolean b = UserController.updateUser(user);

		System.out.println("ORDER SAVED ?? " + b+ ", NO : "+i);
	}

	public static void displayOrdersUsers() {
		List<Order> orders = OrderController.getAllOrders();
		for (Order o : orders) {
			System.out.println(o.getFirstName() + " : " + o.getUser().getFirstName() + " : " + o.getUser().getId());
		}
	}

	public static void userOrders() {
		User user = UserController.getUserById(1);
		for (Order o : user.getOrders()) {
			System.out.println(o.getAddress().getAddressLine1());
			for (ProductQuantity pq : o.getProducts()) {
				System.out.println("---- Quantity ---");
				System.out.println(pq.getQuantity() + " : " + pq.getProduct());
			}
		}
	}
	public static void tests() {
//		System.out.println((int)Math.ceil(Math.random()*1000000));
//		displayOrdersUsers();
//		userOrders();
//		displayOrders();
//		saveOrder();
//		System.out.println(UserController.removeOrderById(1,1));
//		Mail.sendPdfInvoice("Dhoni Singh", "akshat.singh1718@gmail.com",84 , "akshat@gmail.com_84.pdf");
//		Product p = ProductController.getProductById(1);
//		for(Image i :p.getImages()){
//			System.out.println(i.getName());
//	}
//		Order o = OrderController.getOrderById(101);
//		o.setPaymentDate(new Date());
//		o.setTransacStatus(true);
//		boolean b = OrderController.updateOrder(o);
//		System.out.println(o);
//		Order o1 = OrderController.getOrderById(50);

	}
	public static void saveProd() {
		long userid = 1;

//		CategoryDAO cdao = new CategoryDAOImpl();
//		UserDAO udao = new UserDAOImpl();
//		Category cat = cdao.getCategoryByName("clothes");
//		User user = udao.getUserById(userid);
		String catname = "justin";
		String subcat = "summer";
		String pname = "Feather Jacket";
		String desc = "xxxxxxxxxxxxxxxxxx ccccccccccccccccccc sssssssssssssss";
		double price = 10023.34;
		double dprice = 10007;
		Set<Image> images = new HashSet<>();
		System.out.println("))))))))))))))----------");
		boolean b = ProductController.save(pname, userid, desc, price, dprice, catname, subcat, images);
		System.out.println(b);
	}

	public static void saveCat(String type) {
		Category cat = new Category();
		cat.setCategoryType(type);
		CategoryDAO dao = new CategoryDAOImpl();
		System.out.println("SAVED CATEGORY >>> " + dao.saveCategory(cat));
	}

	public static void main(String[] args) throws IOException {
		User user = UserController.getUserById(6);
		for(ProductQuantity pq : user.getCart().getProducts()) {
			System.out.println(pq);
		}
		System.out.println("------");
//		saveProd();
//		saveCat("sports");
//		System.out.println("_done_");
//		List<Product> ps = ProductController.getAllProducts();
//		for(Product p: ps) {
//			System.out.println(p.getCategory().getCategoryType());
//		}
//		System.out.println(UserController.getUserById(2));
//		List<User> us = UserController.getAllUsers();
//		for(User u :us) {
//			System.out.println(u.getId()+" : "+u.getDob());
//		}
	}

}
