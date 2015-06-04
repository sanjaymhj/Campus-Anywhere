package partha.chat;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;

/**
* @author partha
* It is used by Chat Application for listening to session events.
*/
public class SessionListener implements HttpSessionAttributeListener 
{
	public void attributeAdded(HttpSessionBindingEvent hsbe)
	{
		//System.out.println("Attribute has been bound");
	}

	public void attributeReplaced(HttpSessionBindingEvent hsbe)
	{
		//System.out.println("Attribute has been replaced");
	}

	
	public void attributeRemoved(HttpSessionBindingEvent hsbe)
	{
		String name = hsbe.getName();
		HttpSession session = hsbe.getSession();
		if ("username".equalsIgnoreCase(name))
		{
			String username = (String)hsbe.getValue();
			if (username != null)
			{
				ServletContext application = session.getServletContext();
				if (application != null)
				{
					Object o = application.getAttribute("chatroomlist");		
					if (o != null)
					{
						ChatRoomList roomList = (ChatRoomList)o;
						ChatRoom room = roomList.getRoomOfChatter(username);
						if (room != null)
						{
							Object chatter = room.removeChatter(username);
										
						}
					}
				}
				else
				{
					System.out.println("ServletContext is null");
				}					
			}
		}		
	}
}