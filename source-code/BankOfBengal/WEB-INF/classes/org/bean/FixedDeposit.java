package org.bean;

public class FixedDeposit {

	public FixedDeposit() {
		// TODO Auto-generated constructor stub
	}
	  String transactionid,fid,accountno,branchcode,email;
	  double amount,interest,prematurepenalty;
	  public double getPrematurepenalty() {
		return prematurepenalty;
	}
	public void setPrematurepenalty(double prematurepenalty) {
		this.prematurepenalty = prematurepenalty;
	}
	int term;
	  String start_date, end_date;
	  String transactiontimestamp, status;

	public String getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getInterest() {
		return interest;
	}
	public void setInterest(double interest) {
		this.interest = interest;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getTransactiontimestamp() {
		return transactiontimestamp;
	}
	public void setTransactiontimestamp(String transactiontimestamp) {
		this.transactiontimestamp = transactiontimestamp;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
