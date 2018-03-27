/**
 * 
 */
package org.bean;

/**
 * @author Nirmallya Kundu
 *
 */
public class BranchDetails {

	/**
	 * 
	 */
	int serial;
	String branchcode, branchname, branchstate, branchcity, branchpincode, branchaddress,status;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BranchDetails() {
		// TODO Auto-generated constructor stub
	}

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public String getBranchcode() {
		return branchcode;
	}

	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}

	public String getBranchname() {
		return branchname;
	}

	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	public String getBranchstate() {
		return branchstate;
	}

	public void setBranchstate(String branchstate) {
		this.branchstate = branchstate;
	}

	public String getBranchcity() {
		return branchcity;
	}

	public void setBranchcity(String branchcity) {
		this.branchcity = branchcity;
	}

	public String getBranchpincode() {
		return branchpincode;
	}

	public void setBranchpincode(String branchpincode) {
		this.branchpincode = branchpincode;
	}

	public String getBranchaddress() {
		return branchaddress;
	}

	public void setBranchaddress(String branchaddress) {
		this.branchaddress = branchaddress;
	}

}
