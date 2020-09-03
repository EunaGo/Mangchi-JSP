package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NullServiceImpl;
import service.Service;
import service.ServiceAsync;

public class FrontController extends HttpServlet{
	
	private Map<String, Service> commands=new HashMap<String, Service>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		Properties prop = new Properties();
		FileInputStream fis = null;
		

		String path="/WEB-INF/commandService.properties";
		String configFile=config.getServletContext().getRealPath(path);
		
		try {
			fis=new FileInputStream(configFile);
			prop.load(fis);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Iterator itr=prop.keySet().iterator();
		
		while(itr.hasNext()) {
			String command=(String) itr.next(); 
			String serviceClassName=prop.getProperty(command);
			
			try {
				Class serviceClass=Class.forName(serviceClassName);
				
				
				Service service=(Service) serviceClass.newInstance();
				
				commands.put(command, service);
				System.out.println(command+"="+service);
								
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}



	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String type=null;
		String command=req.getRequestURI();
		System.out.println(command);
		System.out.println(command.indexOf(req.getContextPath()));
		
		if(command.indexOf(req.getContextPath())==0) {
			type=command.substring(req.getContextPath().length());
		}
		
		Service service=commands.get(type);
		
		if(service==null) {
			service=new NullServiceImpl();
		}
		

		String page=service.getViewPage(req, resp);
		

		RequestDispatcher dispatcher=req.getRequestDispatcher(page);
		dispatcher.forward(req, resp);
		
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
}

