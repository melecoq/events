package events

class Page {

	String description;

	Menu menu;
	Event event;

    static constraints = {
    	description blank:false;
    	menu blank:false;
    	event blank:false;
    }
}
