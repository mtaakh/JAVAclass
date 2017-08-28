package dppom.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailMain extends Authenticator
{
	private String fromEmail;
	private String password;
	
	public MailMain(String fromEmail, String password)
	{
		this.fromEmail = fromEmail;
		this.password = password;
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication()
	{
		return new PasswordAuthentication(fromEmail, password);
	}
}
