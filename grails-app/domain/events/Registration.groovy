package events

class Registration {

	User user;
	Event event;
	Boolean validate=false;

    static constraints = {
    	user blank:false
    	event blank:false
    }
}
