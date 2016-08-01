package events

class Agenda {

	static belongsTo = User;
	static hasMany = [users:User];
	Date day;
	Date startHour;
	Date endHour;
	String description;
	String fileUrl;
	boolean breaks;
	boolean endDay;


    static constraints = {
    	day blank:false;
    	startHour blank:false;
    	endHour blank:false;
    	email blank:false, email:true, unique:true;
    }
}
