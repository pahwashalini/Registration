package project4;

public class RegistrationOfCases {

	int RegistrationSerialNo;
	String RegistrationDate ;
	String ModeOfInformation;
	String PlaceOfOccurence  ;
	String InvestigatingOfficerName;
	int Freeze;
	public  RegistrationOfCases(int no, String dt, String mode,String place, String officer,int freeze) 
    { 
        this.RegistrationSerialNo=no;
        this.RegistrationDate=dt;
        this.ModeOfInformation=mode;
        this.PlaceOfOccurence=place;
        this.InvestigatingOfficerName=officer;
        this.Freeze=freeze;
    }
	public int getFreeze() 
    { 
        return Freeze; 
    }
	public int getRegistrationSerialNo() 
    { 
        return RegistrationSerialNo; 
    } 
	public String getRegistrationDate() 
    { 
        return RegistrationDate; 
    } 
	public String getModeOfInformation() 
    { 
        return ModeOfInformation; 
    } 
	
	public String getPlaceOfOccurence() 
    { 
        return PlaceOfOccurence; 
    } 
	public String getInvestigatingOfficerName() 
    { 
        return InvestigatingOfficerName; 
    } 
}
