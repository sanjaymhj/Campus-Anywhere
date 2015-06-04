package partha.chat;

import java.util.HashMap;
import java.util.Map;


/**
* @author partha
* This class represents a chatter in the chat room.
*/
public class Chatter
{
	
        private String name = null;
        private String fname = null;
        private String lname = null;
	private String dob = null;
        private String email = null;
        private String sex = null;
	private String edu_level = null;
	private String school = null;
        private String country = null;
        private String city = null;
        private String mobile = null;
	private long loginTime = -1;
	private long enteredInRoomAt = -1;
        private boolean profilevisibility;
	
	
	public Chatter(HashMap profiledata , long loginTime)
	{
		name=(String)profiledata.get("id");
                fname=(String)profiledata.get("fname");
                lname=(String)profiledata.get("lname");
                dob=(String)profiledata.get("dob");
                email=(String)profiledata.get("email");
                sex=(String)profiledata.get("sex");
                edu_level=(String)profiledata.get("edu_level");
                school=(String)profiledata.get("school");
                country=(String)profiledata.get("country");
                city=(String)profiledata.get("city");
                mobile=(String)profiledata.get("mobile");
                this.loginTime=loginTime;
                if(name.startsWith("prof"))
                {
                    profilevisibility=true;
                }
                else
                {
                    profilevisibility=false;
                }
                
	}	
	
	public String getName()
	{
		return name;
	}
        
        public String getFirstName()
	{
		return fname;
	}
        
        public String getLastName()
	{
		return lname;
	}
        
        public String getDOB()
	{
		return dob;
	}
	
        public String getEmail()
	{
		return email;
	}

        public String getSex()
	{
		return sex;
	}

      	public String getEduLevel()
	{
		return edu_level;
	}
        
      	public String getSchool()
	{
		return school;
	}

        public String getCountry()
	{
		return country;
	}
	
        public String getCity()
	{
		return city;
	}

	public String getMobile()
	{
		return mobile;
	}

	public long getLoginTime()
	{
		return loginTime;
	}

	public void setEnteredInRoomAt( long enteredAt)
	{
		this.enteredInRoomAt = enteredAt;
	}

        public long getEnteredInRoomAt()
	{
		return enteredInRoomAt;
	}
        
        public void changeProfileVisibility()
        {
           profilevisibility=!profilevisibility;
           if(name.startsWith("prof"))
               profilevisibility=true;
        }
        
        public boolean getProfileVisibility()
        {
            return profilevisibility;
        }
}