package partha.chat.servlet;


import database.Login;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import partha.chat.ChatRoom;
import partha.chat.ChatRoomList;
import partha.chat.Chatter;

/**
@author partha
*/
public class LoginServlet extends HttpServlet
{
	private String contextPath = "";
	/** This method just redirects user to a login page.*/
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/login.jsp");		
	}
	/*Performs some validation and if everything is ok sends user to a page which displays a list of
	* rooms available.
	*/
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
            
            
                contextPath = request.getContextPath();
                String username = request.getParameter("username");
                username = username.trim().toLowerCase();
                String password = request.getParameter("txtpass");
                
               HashMap profiledata= new HashMap();
                
               int log = Login.checkLoginData(username, password);
               
               
                
                if (log==1)
                {
                    try
                    {
                        
                        profiledata=Login.getProfile(username);
                
                        
                        ChatRoomList roomlist = (ChatRoomList)getServletContext().getAttribute("chatroomlist");
                        boolean chatterexists = roomlist.chatterExists(username);
                        
                        if (chatterexists)
                        {
                            request.setAttribute("error", "You are already logged in.");
                            response.sendRedirect(contextPath + "/index.jsp");
                        }
                        else
                        {
                            HttpSession session = request.getSession(true);
                            int timeout = 1800; // 30 minutes
                            String t = getServletContext().getInitParameter("sessionTimeout"); // gets Minutes
                            if (t != null)
                            {
                                try
                                {
                                    timeout = Integer.parseInt(t);
                                    timeout = timeout * 60;
                                }
                                catch (NumberFormatException nfe)
                                {
                                }
                            }
                            session.setMaxInactiveInterval(timeout);
                            session.setAttribute("username", username);
                            // Because Chatter objects are stored in room.
                            // So before user selects any room he is added to a temporary room "StartUp"
                            ChatRoom chatRoom = roomlist.getRoom("StartUp");
                            username = username.toLowerCase();
                            Chatter chatter = null;
                            
                            chatter = new Chatter(profiledata, new java.util.Date().getTime());
                            chatRoom.addChatter(chatter);
                            response.sendRedirect(contextPath + "/listrooms.jsp");
                            
                        }
                    }
                    catch(Exception exception)
                    {
                        System.out.println("Exception thrown in LoginServlet: " + exception.getMessage());
                        exception.printStackTrace();
                        response.sendRedirect(contextPath + "/error.jsp");
                    }
                }
                else if(log==2)
                {
                    request.setAttribute("error", "Password mismatch");
                    response.sendRedirect(contextPath + "/index.jsp");
                }
                else
                {
                    request.setAttribute("error", "Invalid Username");
                    response.sendRedirect(contextPath + "/index.jsp");
                }
            
	}
}