component accessors="true" {
	
	property name="bookDAO";
	property name="bookGateway";

	function init(required bookDAO, required bookGateway) {
		variables.bookDAO = arguments.bookDAO;
		variables.bookGateway = arguments.bookGateway;

		return this;
	}

	function getBook(id = 0) {
		
	}

	function save(required book) {
		
	}

	function delete(required book) {
		
	}

	function getAll() {
		
	}

	function getByAuthor(required author) {
		
	}



}