package mypack;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;


public class mail
{

    
public boolean sendemail(String to,String from,String text,String subject)
{ 
boolean flag=false;

    Properties properties=new Properties();
    properties.put("mail.smtp.auth", true);
    properties.put("mail.smtp.starttls.enable", true);
    properties.put("mail.smtp.port","587");
    properties.put("mail.smtp.host", "smtp.gmail.com");
    
    
    
    //session
    Session session= Session.getInstance(properties, new Authenticator() {
    @Override
    protected PasswordAuthentication getPasswordAuthentication(){
    return new PasswordAuthentication("quiztest147","oogw grvx jmni tdnl");
    }
    });
    
    try {
        
        
        Message message=new MimeMessage(session);
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setFrom(new InternetAddress(from));
        message.setSubject(subject);
        message.setText(text);
        Transport.send(message);
        
        flag=true;
        
    } catch (Exception e) {
        e.printStackTrace();
    }

return flag;
}
}        