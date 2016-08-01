package events

class Menu {

	String name;
	String menuUrl;

    static constraints = {
    	name blank:false;
    	menuUrl blank:false;
    }
}
