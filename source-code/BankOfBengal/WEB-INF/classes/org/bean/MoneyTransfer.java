package org.bean;

public class MoneyTransfer {

	public MoneyTransfer() {
		// TODO Auto-generated constructor stub
	}
	 String transactionid, branchcode,email,sender_accountno, receiver_accountno, receiver_bank;
	 public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBranchcode() {
		return branchcode;
	}
	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}
	double amount,bankcharges,totalamount;
	 public double getBankcharges() {
		return bankcharges;
	}
	public void setBankcharges(double bankcharges) {
		this.bankcharges = bankcharges;
	}
	public double getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}
	public String getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}
	public String getSender_accountno() {
		return sender_accountno;
	}
	public void setSender_accountno(String sender_accountno) {
		this.sender_accountno = sender_accountno;
	}
	public String getReceiver_accountno() {
		return receiver_accountno;
	}
	public void setReceiver_accountno(String receiver_accountno) {
		this.receiver_accountno = receiver_accountno;
	}
	public String getReceiver_bank() {
		return receiver_bank;
	}
	public void setReceiver_bank(String receiver_bank) {
		this.receiver_bank = receiver_bank;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
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
	String transactiontimestamp;
	 String status;

}
