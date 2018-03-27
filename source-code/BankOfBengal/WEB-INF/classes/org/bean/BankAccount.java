/**
 * 
 */
package org.bean;

/**
 * @author Nirmallya
 *
 */
public class BankAccount {

	/**
	 * 
	 */
	public BankAccount() {
		// TODO Auto-generated constructor stub
	}
	
	String transactionid,branchcode,accountno,transactiontimestamp,transactiontype;
	public String getTransactiontype() {
		return transactiontype;
	}
	public void setTransactiontype(String transactiontype) {
		this.transactiontype = transactiontype;
	}
	public String getTransactiontimestamp() {
		return transactiontimestamp;
	}
	public void setTransactiontimestamp(String transactiontimestamp) {
		this.transactiontimestamp = transactiontimestamp;
	}

	double bankcharges;
	public String getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}
	public String getBranchcode() {
		return branchcode;
	}
	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public double getBankcharges() {
		return bankcharges;
	}
	public void setBankcharges(double bankcharges) {
		this.bankcharges = bankcharges;
	}

}
