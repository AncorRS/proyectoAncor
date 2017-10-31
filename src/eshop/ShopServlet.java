package eshop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eshop.beans.Book;
import eshop.beans.CartItem;
import eshop.beans.Customer;
import eshop.model.DataManager;
import java.util.Hashtable;

public class ShopServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	public ShopServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		
		System.out.println("*** initializing controller servlet.");
		super.init(config);

		DataManager dataManager = new DataManager();
		dataManager.setDbURL(config.getInitParameter("dbURL"));
		dataManager.setDbUserName(config.getInitParameter("dbUserName"));
		dataManager.setDbPassword(config.getInitParameter("dbPassword"));

		ServletContext context = config.getServletContext();
		context.setAttribute("base", config.getInitParameter("base"));
		context.setAttribute("imageURL", config.getInitParameter("imageURL"));
		context.setAttribute("dataManager", dataManager);

		try { // load the database JDBC driver
			Class.forName(config.getInitParameter("jdbcDriver"));
		} catch (ClassNotFoundException e) {
			System.out.println(e.toString());
		}
	}

	protected void addItem(HttpServletRequest request, DataManager dm) {
		
		HttpSession session = request.getSession(true);
		Hashtable<String, CartItem> shoppingCart = (Hashtable<String, CartItem>) session.getAttribute("shoppingCart");
		if (shoppingCart == null) {
			shoppingCart = new Hashtable<String, CartItem>(10);
		}
		// String action = request.getParameter("action");
		// if (action != null && action.equals("addItem")) {
		try {
			String bookId = request.getParameter("bookId");
			Book book = dm.getBookDetails(bookId);
			if (book != null) {
				CartItem item = new CartItem(book, 1);
				shoppingCart.remove(bookId);
				shoppingCart.put(bookId, item);
				session.setAttribute("shoppingCart", shoppingCart);
			}
		} catch (Exception e) {
			System.out.println("Error adding the selected book to the shopping cart!");
		}
		// }
	}

	protected void updateItem(HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		Hashtable<String, CartItem> shoppingCart = (Hashtable<String, CartItem>) session.getAttribute("shoppingCart");
		String bookId = request.getParameter("bookId");
		String cantidad = request.getParameter("quantity");
		CartItem book = shoppingCart.get(bookId);
		try {
			
			if(Integer.parseInt(cantidad) > 0){
			
			book.setQuantity(Integer.parseInt(cantidad));
			shoppingCart.put(bookId, book);
			}
			
		} catch (NumberFormatException e) {

		}

	}

	protected void deleteItem(HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		Hashtable<String, CartItem> shoppingCart = (Hashtable<String, CartItem>) session.getAttribute("shoppingCart");
		String bookId = request.getParameter("bookId");
		shoppingCart.remove(bookId);
	}

	protected void orderConfirmation(HttpServletRequest request, DataManager dm) {
		
		HttpSession session = request.getSession(true);
		
		Customer customer = new Customer();
		
		Hashtable<String, CartItem> cart = (Hashtable<String, CartItem>) session.getAttribute("shoppingCart");
		
		customer.setCcExpiryDate(request.getParameter("ccExpiryDate"));
		customer.setCcName(request.getParameter("ccName"));
		customer.setCcNumber(request.getParameter("ccNumber"));
		customer.setContactName(request.getParameter("contactName"));
		customer.setDeliveryAddress(request.getParameter("deliveryAddress"));
		
		 long orderId = dm.insertOrder(customer, cart);
		 
		 request.setAttribute("id", orderId);
		 
		    if (orderId > 0L) {
		    	
		      session.invalidate();
		      
		    }
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String base = "/jsp/";
		String url = base + "index.jsp";
		String action = request.getParameter("action");
		// recuperar datamanager del contexto
		DataManager datamanager = (DataManager) request.getServletContext().getAttribute("dataManager");
		
		if (action != null) {
			
			switch (action) {
			
			case "search":
				url = base + "SearchOutcome.jsp";
				break;
				
			case "selectCatalog":
				url = base + "SelectCatalog.jsp";
				break;
				
			case "bookDetails":
				url = base + "BookDetails.jsp";
				break;
				
			case "checkOut":
				url = base + "Checkout.jsp";
				break;
				
			case "orderConfirmation":
				orderConfirmation(request, datamanager);
				url = base + "OrderConfirmation.jsp";
				//Actualizar ordenes y detalles de ordenes
				break;
				
			case "addItem":
				addItem(request, datamanager);
				url = base + "ShoppingCart.jsp";
				break;
				
			case "updateItem":
				updateItem(request);
				url = base + "ShoppingCart.jsp";
				break;
				
			case "deleteItem":
				deleteItem(request);
				url = base + "ShoppingCart.jsp";
				break;
				
			case "showCart":
				url = base + "ShoppingCart.jsp";
				break;
				
			}
		}
		
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
	}
}
