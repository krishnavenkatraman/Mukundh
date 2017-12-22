package com.businesslogic;

import java.util.ArrayList;
import java.util.HashMap;

public class Compute {

	private double monthlyInterestRate = 0.0;
	protected double interestDue = 0.00;	
	public double principlalAmount;	
	protected double monthlyPaymentAmt;
	
	private double newBalance = principlalAmount;
	private double cumulativeInterestPaid = 0.00;
	
	HashMap<String, Double> summaryList = new HashMap<String, Double>();	 

	// *******POJO's BEGIN
	
	public HashMap<String, Double> getSummaryList() {
		return summaryList;
	}

	public void setSummaryList(HashMap<String, Double> summaryList) {
		this.summaryList = summaryList;
	}

	public double getPrinciplalAmount() {
		return principlalAmount;
	}

	public void setPrinciplalAmount(double principlalAmount) {
		this.principlalAmount = principlalAmount;
	}

	public double getMonthlyPaymentAmt() {
		return monthlyPaymentAmt;
	}

	public void setMonthlyPaymentAmt(double monthlyPaymentAmt) {
		this.monthlyPaymentAmt = monthlyPaymentAmt;
	}
	
	public double getCumulativeInterestPaid() {
		return cumulativeInterestPaid;
	}

	public void setCumulativeInterestPaid(double cumulativeInterestPaid) {
		this.cumulativeInterestPaid = cumulativeInterestPaid;
	}

	public double getMonthlyInterestRate() {
		return monthlyInterestRate;
	}
	
	public void setMonthlyInterestRate(double monthlyInterestRate) {
		this.monthlyInterestRate = (monthlyInterestRate/100) / 12 ;	
	}
	
	public double getNewBalance() {
		return newBalance;
	}

	public void setNewBalance(double newBalance) {
		this.newBalance = newBalance;
	}
	
	public double getInterestDue() {
		return interestDue;
	}

	public void setInterestDue(double interestDue) {
		this.interestDue = interestDue;
	}
// *******POJO's END	
	
	public HashMap<Integer, ArrayList<Double>> getMonthlyPaymentDetails(double princip, double interestRate, double monthlyPayAmt ){
		
		int i =1;
		double interestDueForCurrentMonth;
		double updatedBalance;
		double orgPrincipal;
		HashMap<Integer, ArrayList<Double>> ammortizedList = null;		
		HashMap<String, Double> sList = null;
		
		sList = new HashMap<String, Double>();
		
		setMonthlyInterestRate(interestRate);
		setPrinciplalAmount(princip);
		setMonthlyPaymentAmt(monthlyPayAmt);		
		setNewBalance(getPrinciplalAmount());		
		
		ammortizedList = new HashMap<Integer, ArrayList<Double>>();		
		
		while (getNewBalance() >0.00) {
				
		ArrayList<Double> currentMonthList = null;
		currentMonthList = new ArrayList<Double>();	
			
		interestDueForCurrentMonth= getNewBalance()*getMonthlyInterestRate();
		setInterestDue(interestDueForCurrentMonth);
		
		orgPrincipal = getNewBalance();
		if (getNewBalance() >= monthlyPayAmt){
		updatedBalance = (getNewBalance()+getInterestDue())-getMonthlyPaymentAmt();
		}else {
			updatedBalance = 0.0;
		}
		setNewBalance(updatedBalance);		
		setCumulativeInterestPaid(getCumulativeInterestPaid()+getInterestDue());
		
			
		currentMonthList.add(orgPrincipal);
		currentMonthList.add(getInterestDue());
	if (getNewBalance() >= monthlyPayAmt){
		currentMonthList.add((getMonthlyPaymentAmt() - getInterestDue()));
	}else{
		currentMonthList.add((orgPrincipal));
	}
		currentMonthList.add(getNewBalance());
		currentMonthList.add(getCumulativeInterestPaid());		
		
		ammortizedList.put(Integer.valueOf(i),currentMonthList);
		
		i++;
		}
		
		sList.put("Total Number of Months", Double.valueOf((double)i) -1);
		sList.put("Monthly Payment Amount",getMonthlyPaymentAmt() );
		sList.put("Overall Payment Towards Principal", getPrinciplalAmount());
		sList.put("Overall Payment Towards Interest",getCumulativeInterestPaid() );
		sList.put("Overall Payment Towards Principal && Interest",(getPrinciplalAmount()+getCumulativeInterestPaid()) );

		setSummaryList(sList);
		
		return ammortizedList;
	}
	
	
	public double getMonthlyPaymtAmtForAGivenTime(double principalAmt, double interestRate, double numberOfYears){
		
		double numberOfMonths;
		double monthlyPaymentAmt; 
		
		numberOfMonths= numberOfYears * 12;		
		monthlyPaymentAmt  = (((interestRate/(100*12)) * principalAmt ) * Math.pow((1 + (interestRate/(100 *12) )), numberOfMonths)) / 
							 (Math.pow((1 + (interestRate/(100 *12) )), numberOfMonths)- 1);
				
		return monthlyPaymentAmt;
	}
	

}
