package com.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.businesslogic.Compute;

/**
 * Servlet implementation class MortgageData
 */
@WebServlet("/MortgageData")
public class MortgageData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MortgageData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter() ;
		
		double prin = Double.parseDouble(request.getParameter("amtBorrowed"));
		double intrestrate =Double.parseDouble( request.getParameter("interestrate")) ;
		double monthlyPayment =Double.parseDouble( request.getParameter("monthlyPaymentAmt"));
		/*EJBApplicationClient client = new EJBApplicationClient();
		client.myMthd();*/
		
		Compute comp = new Compute();
		
		HashMap<Integer, ArrayList<Double>> myMap =   null;
		HashMap<String, Double> entireSummaryMap =   null;
		myMap = comp.getMonthlyPaymentDetails(prin, intrestrate, monthlyPayment);
		entireSummaryMap= comp.getSummaryList();
/*System.out.println(myMap.size());
for (int i =0; i<myMap.size();i++){
	
	for (int j=0; j<myMap.get(i).size();j++){
		System.out.println(myMap.get(i).get(j));
		System.out.println();
	}
	
}*/
		request.setAttribute("summary", entireSummaryMap);
		request.setAttribute("ammortizationList", myMap);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/MortgageHandler.jsp");
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Compute comp = new Compute();
		double prin = Double.parseDouble(request.getParameter("amtBorrowed"));
		double intrestrate =Double.parseDouble( request.getParameter("interestrate")) ;		
		double monthlyPayment = 0.0; 
		double numberOfYears = 0.0;		
		
		if (request.getParameter("mnthlyPaymtChckBx") != null && request.getParameter("mnthlyPaymtChckBx").equalsIgnoreCase("Y")){			
			monthlyPayment = Double.parseDouble( request.getParameter("monthlyPaymentAmt"));
		}else if (request.getParameter("mnthlyPaymtChckBx") == null){
			numberOfYears = Double.parseDouble( request.getParameter("numberofYrs")) ;
			monthlyPayment = comp.getMonthlyPaymtAmtForAGivenTime(prin, intrestrate, numberOfYears);
		}		
	
		HashMap<Integer, ArrayList<Double>> myMap =   null;
		HashMap<String, Double> entireSummaryMap =   null;
		myMap = comp.getMonthlyPaymentDetails(prin, intrestrate, monthlyPayment);
		entireSummaryMap= comp.getSummaryList();

		request.setAttribute("summary", entireSummaryMap);
		request.setAttribute("ammortizationList", myMap);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/MortgageHandler.jsp");
		dispatcher.forward(request,response);
	}

	
	

	
}
