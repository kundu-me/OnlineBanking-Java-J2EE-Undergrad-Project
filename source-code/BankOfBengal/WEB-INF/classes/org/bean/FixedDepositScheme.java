package org.bean;

public class FixedDepositScheme {

	public FixedDepositScheme() {
		// TODO Auto-generated constructor stub
	}
	
	String customertype,customerage;
    int min_days, max_days;
    double interest,prematurepenalty;
    String status;
	public String getCustomertype() {
		return customertype;
	}
	public void setCustomertype(String customertype) {
		this.customertype = customertype;
	}
	public String getCustomerage() {
		return customerage;
	}
	public void setCustomerage(String customerage) {
		this.customerage = customerage;
	}
	public int getMin_days() {
		return min_days;
	}
	public void setMin_days(int min_days) {
		this.min_days = min_days;
	}
	public int getMax_days() {
		return max_days;
	}
	public void setMax_days(int max_days) {
		this.max_days = max_days;
	}
	public double getInterest() {
		return interest;
	}
	public void setInterest(double interest) {
		this.interest = interest;
	}
	public double getPrematurepenalty() {
		return prematurepenalty;
	}
	public void setPrematurepenalty(double prematurepenalty) {
		this.prematurepenalty = prematurepenalty;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
