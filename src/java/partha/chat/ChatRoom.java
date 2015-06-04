package partha.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

/** 
*@author partha
* This class represents a chat room in the Chat System
*/
public class ChatRoom 
{
	
	private String name = null;
	
        private String description = null;
	
	private Map chatters = new HashMap();
	
	private List messages = new LinkedList();
        
        private String professor = null;
	
	private String professorid = null;
        
	private int messages_size = 25;
        
        private Map kickedoutchatters = new HashMap();
	
        public ChatRoom(String name, String descr)
	{
		this.name= name;
		this.description = descr;
                if(!name.equalsIgnoreCase("startup"))
                {
                    this.professorid=name.substring(name.indexOf('(')+1, name.indexOf(')'));
                    this.professor= name.substring(0, name.indexOf('_')) +" "+name.substring(name.indexOf('_')+1, name.lastIndexOf('_'));
                }
                
	}
	
	
	public String getName()
	{
		return name;
	}
	
        public String getProfessor()
        {
            return professor;
        }
	
        public String getProfessorId()
        {
            return professorid;
        }
        
	public String getDescription()
	{
		return description;
	}
	
	
	public synchronized void addChatter(Chatter chatter)
	{
		chatters.put(chatter.getName(), chatter);
	}
	
	public synchronized Object removeChatter(String chatterName)
	{
            if(chatterName.equalsIgnoreCase(professorid))
            {
                kickedoutchatters.clear();
            }
                    
		return chatters.remove(chatterName);
	}
	
	
	public Chatter getChatter(String chatterName)
	{
		return (Chatter)chatters.get(chatterName);
	}
	
	public boolean chatterExists(String chatterName)
	{
		return chatters.containsKey(chatterName);
	}
	
	
	public int getNoOfChatters()
	{
		return chatters.size();
	}
	
	
	public Set getChatters()
	{
		return chatters.entrySet();
	}
	
	
	public Chatter[] getChattersArray()
	{
		Chatter[] chattersArray = new Chatter[chatters.size()];
		Set chatters = getChatters();
		Iterator chattersit = chatters.iterator();
		int i = 0;
		while(chattersit.hasNext())
		{
			chattersArray[i] = (Chatter)((Map.Entry)chattersit.next()).getValue();
			i++;
		}
		return chattersArray;
	}
	
	
	public synchronized void addMessage(Message msg) 
	{
		if(messages.size()==messages_size)
		{
			((LinkedList)messages).removeFirst();
		}
		messages.add(msg);
           
	}
	
	
	public ListIterator getMessages()
	{
            
            return messages.listIterator();
                
	}

	
	public Message[] getMessages(long afterTimeStamp)
	{
		ListIterator li = messages.listIterator();
		List temp = new ArrayList();
		Message m;
		while (li.hasNext())
		{
			m = (Message)li.next();
			//if (m.getTimeStamp() >= afterTimeStamp)
			//{
				temp.add(m);
		//	}
		}
		Object o[] = temp.toArray();
		Message[] arr = new Message[o.length];
		for (int i = 0; i < arr.length; i++)
		{
			arr[i] = (Message)o[i];
		}
		return arr;
	}

	
	public int getNoOfMessages()
	{
		return messages.size();
	}
	
	
	public void setMaximumNoOfMessages(int size)
	{
		messages_size = size;
	}
	
	
	public int getMaxiumNoOfMessages()
	{
		return messages_size;
	}
        
        public synchronized void KickOut(String name, Chatter chatter) 
	{
		kickedoutchatters.put(name,chatter);
                removeChatter(name);
                
           
	}
        
        public boolean isKickedOut(String name)
        {
            if(kickedoutchatters.get(name)==null) 
            {
                return false;
            }
            else 
            {
                return true;
            }
        }
        
      }
