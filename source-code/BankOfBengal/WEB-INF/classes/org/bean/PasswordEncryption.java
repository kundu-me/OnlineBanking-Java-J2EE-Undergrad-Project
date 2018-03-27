/**
 * 
 */
package org.bean;

/**
 * @author Nirmallya
 *
 */
public class PasswordEncryption {

	/**
	 * 
	 */
	public PasswordEncryption() {
		// TODO Auto-generated constructor stub
	}
	private static final String CHAR_LIST = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*";

	public String passwordEncryption(String password)
	{
		int n=4;
		int substitution=0;
		
		StringBuffer encryptedPassword = new StringBuffer();
		int passwordLength=password.length();
		
		for(int i=0; i<passwordLength; i++)
		{
			char c=password.charAt(i);
			int number = CHAR_LIST.indexOf(c);
			
			substitution=(number+n)%CHAR_LIST.length();
			
			char ch = CHAR_LIST.charAt(substitution);
			encryptedPassword.append(ch);
		}
		return encryptedPassword.toString();
	}
	
	public String passwordDecryption(String password)
	{
		int n=4;
		int substitution=0;
		
		StringBuffer decryptedPassword = new StringBuffer();
		int passwordLength=password.length();
		
		for(int i=0; i<passwordLength; i++)
		{
			char c=password.charAt(i);
			int number = CHAR_LIST.indexOf(c);
			
			substitution=(number-n)%CHAR_LIST.length();
			
			char ch = CHAR_LIST.charAt(substitution);
			decryptedPassword.append(ch);
		}
		return decryptedPassword.toString();
	}

}
