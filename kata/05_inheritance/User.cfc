component accessors="true" {
	
	property name="userId";
	property name="firstName";
	property name="lastName";
	property name="email";

	public function init(
		userId = "",
		firstName = "",
		lastName = "",
		email = ""
	){
		
		variables.userId = arguments.userId;
		variables.firstName = arguments.firstName;
		variables.lastName = arguments.lastName;
		variables.email = arguments.email;

		return this;
	}

}