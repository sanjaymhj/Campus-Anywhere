package partha.chat;

import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.Iterator;

/** 
*@author partha
* This class is used to manipulate and store ChatRoom objects.
*/
public class ChatRoomList
{
	private Map roomList;
	
        public ChatRoomList()
	{
		roomList = new HashMap();
	}
	
	public synchronized void addRoom(ChatRoom room)
	{
		roomList.put(room.getName(), room);
	}
	
	public synchronized void removeRoom(String name)
	{
		roomList.remove(name);
	}
	
	
	public ChatRoom getRoom(String name)
	{
		return (ChatRoom) roomList.get(name);
	}
	
        public ChatRoom getRoomOfChatter(String name)
	{
		ChatRoom[] rooms = this.getRoomListArray();
		for (int i = 0; i < rooms.length; i++)
		{
			boolean chatterexists = rooms[i].chatterExists(name);
			if (chatterexists)
			{
				return rooms[i];
			}
		}
		return null;
	}
	
	public Set getRoomList()
	{
		return roomList.entrySet();
	}
	
	public ChatRoom[] getRoomListArray()
	{
		ChatRoom[] roomListArray = new ChatRoom[roomList.size()];
		Set roomlist = getRoomList();
		Iterator roomlistit = roomlist.iterator();
		int i = 0;
		while(roomlistit.hasNext())
		{
			roomListArray[i] = (ChatRoom)(((Map.Entry)roomlistit.next()).getValue());
			i++;
		}
		return roomListArray;
	}
	
	public boolean chatterExists(String username)
	{
		boolean chatterexists = false;
		ChatRoom[] rooms = this.getRoomListArray();
		for (int i = 0; i < rooms.length; i++)
		{
			chatterexists = rooms[i].chatterExists(username);
			if (chatterexists)
			{
				break;
			}
		}
		return chatterexists;
	}
}