/**
 * 
 */
package org.bean;

/**
 * @author Nirmallya
 *
 */
public class CustomerLogin {

	/**
	 * 
	 */
	public CustomerLogin() {
		// TODO Auto-generated constructor stub
	}
	String username;
	String accountno;
	String logintimestamp;
	String ipaddress;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getLogintimestamp() {
		return logintimestamp;
	}
	public void setLogintimestamp(String logintimestamp) {
		this.logintimestamp = logintimestamp;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}
}
