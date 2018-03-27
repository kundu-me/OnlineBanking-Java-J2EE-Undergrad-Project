package org.bean;

public class FixedDepositMature {

	public FixedDepositMature() {
		// TODO Auto-generated constructor stub
	}

	String fid;
	String tid;
	String accountno;
	String branchcode;
	double amount;
	double interestamount;
	double prematurepenaltyamount;
	double totalamount;
	String mature_date;
	public String getMature_date() {
		return mature_date;
	}
	public void setMature_date(String mature_date) {
		this.mature_date = mature_date;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getBranchcode() {
		return branchcode;
	}
	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getInterestamount() {
		return interestamount;
	}
	public void setInterestamount(double interestamount) {
		this.interestamount = interestamount;
	}
	public double getPrematurepenaltyamount() {
		return prematurepenaltyamount;
	}
	public void setPrematurepenaltyamount(double prematurepenaltyamount) {
		this.prematurepenaltyamount = prematurepenaltyamount;
	}
	public double getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}
}
