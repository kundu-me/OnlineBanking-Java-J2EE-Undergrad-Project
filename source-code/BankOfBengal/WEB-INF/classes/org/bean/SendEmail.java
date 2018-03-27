package org.bean;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail
{

	public SendEmail()
	{
		// TODO Auto-generated constructor stub
	}

		public void sendEmail (String TO_RECIPIENT, String SUBJECTTO_RECIPIENT, String MESSAGE_TO_RECIPIENT)
		{
	 
			final String username = "bankofbengal.india@gmail.com";
			final String password = "nirmallya1234";
	 
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
	 
			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
	 
			try {
	 
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("bankofbengal.india@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(TO_RECIPIENT));
				message.setSubject(SUBJECTTO_RECIPIENT);
				message.setText(MESSAGE_TO_RECIPIENT+"\n"
					+ "\n\n -This is an auto generated Email."+"\n\n"+""
						+"- Thank You\n Nirmallya Kundu \n Administrator - Bank Of Bengal");
	 
				Transport.send(message);
	 			} 
			catch (MessagingException e)
	 		{
				throw new RuntimeException(e);
			}
		}
		
		public void sendEmailToAll (String EMAIL, String SUBJECTTO_RECIPIENT, String MESSAGE_TO_RECIPIENT)
		{
	 
			final String username = "bankofbengal.india@gmail.com";
			final String password = "nirmallya1234";
			InternetAddress[] address;
			String addresslist=EMAIL;
			
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
	 
			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
	 
			try {

				
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("bankofbengal.india@gmail.com"));
				
					address=InternetAddress.parse(addresslist);
					message.setRecipients(Message.RecipientType.TO,address);
				
					message.setSubject(SUBJECTTO_RECIPIENT);
					message.setText(MESSAGE_TO_RECIPIENT+"\n"
					+ "\n\n -This is an auto generated Email."+"\n\n"+""
					+"- Thank You\n Nirmallya Kundu \n Administrator - Bank Of Bengal");
	 				Transport.send(message);
				
	 		} 
			catch (MessagingException e)
	 		{
				throw new RuntimeException(e);
			}
		}
	}

