component accessors="true" {
	
	property name="bookDAO";
	property name="bookGateway";

	/**
	* Constructor
	* 
	* @bookDAO.inject kata.oo.di.BookDAO
	* @bookGateway.inject kata.oo.di.BookGateway
	*/
	function init(required bookDAO, required bookGateway) {
		variables.bookDAO = arguments.bookDAO;
		variables.bookGateway = arguments.bookGateway;

		return this;
	}

	function getBook(id = 0) {
		throw "Not Implemented";
	}

	function save(required book) {
		throw "Not Implemented";
	}

	function delete(required book) {
		throw "Not Implemented";
	}

	function getAll() {
		//stores the user collection
		var books = [];
		//get the user data
		var qbooks = bookGateway.getAll();

		for (var row in qbooks) { 
			books.append(new Book(
				id = row.id,
				title = row.title,
				author = row.author
			));
		}

		return books;
	}

	function getByAuthor(required author) {
		
	}



}