package partha.chat.servlet;

import static database.Registration.generateIdOf;
import static database.Registration.register;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import partha.chat.ChatRoom;
import partha.chat.ChatRoomList;

/** Allows users to add new rooms.
* At server startup this servlet is initialised.
* @author partha
*/
public class ManageChatServlet extends HttpServlet
{
	public static ChatRoomList rooms = new ChatRoomList();
	public static Properties props = null;
	
	public void init() throws ServletException
	{
		try
		{
			String path = "";
			path = "/WEB-INF/"+getServletContext().getInitParameter("chatpropertyfile");
			String realPath;
			realPath = getServletContext().getRealPath(path);
			
			
			if (realPath != null)
			{
				InputStream fis = new FileInputStream(realPath);

				props = new Properties();
				props.load(fis);
				Enumeration keys = props.keys();
				while (keys.hasMoreElements())
				{
					String roomName = (String)keys.nextElement();
					String roomDescr = (String)props.getProperty(roomName);
					addNewRoom(roomName, roomDescr);
				}
				fis.close();
				getServletContext().setAttribute("chatroomlist", rooms);
				System.err.println("Room List Created");
			}
			else
			{
				System.out.println("Unable to get realpath of chatproperty file " + path + ".\nCheck that application war file is expanded and file can be read.\nChat application won't work.");
			}
		}
		catch(FileNotFoundException fnfe)
		{
			System.err.println("Properites file not found:" + fnfe.getMessage());
		}
		catch(IOException ioe)
		{
			System.out.print("Unable to load Properties File: " + ioe.getMessage());
		}		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("Room List Created");
		out.close();
	}
	
	/*	
            Allows users to add new rooms after performing minimum validation.
            Also saves information to chat.properties files if required by initialization parameter
	*/
        @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
            
              
            HashMap profiledata=new HashMap();
            
            profiledata.put("fname",request.getParameter("rfname"));
            profiledata.put("lname",request.getParameter("rlname"));
            profiledata.put("dob",request.getParameter("rdob"));
            profiledata.put("email",request.getParameter("remail"));
            profiledata.put("edu",request.getParameter("edu"));
            profiledata.put("school",request.getParameter("school"));
            profiledata.put("country",request.getParameter("country"));
            profiledata.put("city",request.getParameter("city"));
            profiledata.put("mobile",request.getParameter("mobile"));
            profiledata.put("pass",request.getParameter("rpass"));
            profiledata.put("gen",request.getParameter("rgen"));
            
            String cat=request.getParameter("rcat");
            profiledata.put("id",database.Registration.generateIdOf(cat));
            database.Registration.register(profiledata);
             if(((String)profiledata.get("id")).contains("prof"))
            {
               
                 String roomName=(String)profiledata.get("fname")+"_"+(String)profiledata.get("lname")+"_("+(String)profiledata.get("id")+")";
                String roomDescr ="Attend lectures from Professor "+(String)profiledata.get("fname")+" "+(String)profiledata.get("lname")+" in this room.";
                try
		{
			if (rooms != null)
			{
				addNewRoom( roomName, roomDescr);
			}
			if (props != null)
			{
				props.put(roomName, roomDescr);
				String path = "/WEB-INF/"+getServletContext().getInitParameter("chatpropertyfile");
				String realPath = getServletContext().getRealPath(path);
                            try (OutputStream fos = new FileOutputStream(realPath)) {
                                props.store(fos, "List of Rooms");
                            }	
                            
			}
			else
			{
				
                                
			}
                }
		catch (IOException e)
		{
				System.err.println("Exception: " + e.getMessage());
		}
            }
             
              String from = "CampusAnywhere";
        String to = (String)profiledata.get("email");
        String subject = "Your Login Details";
        String message = (String)profiledata.get("fname")+" "+(String)profiledata.get("lname")+", Welcome to Campus Anywhere. "
                + "Your Login ID is "+(String)profiledata.get("id")+". Note that you won't be able to change it.";
        String login ="campusanywhere2014@gmail.com";
        String password = "hpsdcm81829";

        try {
            Properties props = new Properties();
            props.setProperty("mail.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");

            Authenticator auth = new SMTPAuthenticator(login, password);

            Session session = Session.getInstance(props, auth);

            MimeMessage msg = new MimeMessage(session);
            msg.setText(message);
            msg.setSubject(subject);
            msg.setFrom(new InternetAddress(from));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Transport.send(msg);

        } catch (AuthenticationFailedException ex) {
           
        } catch (AddressException ex) {
           

        } catch (MessagingException ex) {
           
        }
           
             
             
              response.sendRedirect(request.getContextPath() + "/registrationsuccess.jsp");
				
	}
        
          private class SMTPAuthenticator extends Authenticator {

        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }

        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
          }
	public void addNewRoom( String roomName, String roomDescr)
	{
		String s = getServletContext().getInitParameter("maxNoOfMessages");
		int maxMessages = 25;
		if (s != null)
		{
			try
			{
				maxMessages = Integer.parseInt(s);
			}
			catch (NumberFormatException nfe)
			{
				
			}
		}
		ChatRoom room = new ChatRoom(roomName, roomDescr);
		room.setMaximumNoOfMessages(maxMessages);
		rooms.addRoom(room);		
	}
          
	/* Called when servlet is being destroyed */

	public void destroy()
	{
		System.err.println("Destroying all rooms");
	}
}