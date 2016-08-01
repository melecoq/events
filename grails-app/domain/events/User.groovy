package events

class User {

	static hasMany = [agendas:Agenda];

	String name;
	String firstName;
	String institution;
	String country;
	String email;
	String specialMenu;
	boolean show = true;

    static constraints = {
    	name blank: false;
    	firstName blank: false;
    	email blank: false, email: true, unique: true;
    }
}
