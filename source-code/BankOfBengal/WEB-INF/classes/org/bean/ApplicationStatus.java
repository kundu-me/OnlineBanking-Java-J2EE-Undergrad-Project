/**
 * 
 */
package org.bean;

/**
 * @author Nirmallya
 *
 */
public class ApplicationStatus {

	/**
	 * 
	 */
	public ApplicationStatus() {
		// TODO Auto-generated constructor stub
	}
	
	int applicationno;
	String cid,email,branchcode,status,remarks;
	
	
	public int getApplicationno() {
		return applicationno;
	}
	public void setApplicationno(int applicationno) {
		this.applicationno = applicationno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getBranchcode() {
		return branchcode;
	}
	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
