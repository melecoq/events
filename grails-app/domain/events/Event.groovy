package events

class Event {

	String name;
	Date startDate;
	Date endDate;
	String description;
	String place;
	boolean oneDay;


    static constraints = {
    	name blank:false;
    	startDate blank:false;
    	place blank:false;
    }
}
