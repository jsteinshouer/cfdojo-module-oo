component accessors="true" {
	
	property name="dsn";

	function init() {

		setDSN({name="KATA_SANDBOX"});
		
		return this;
	}

	function getAll() {
		var qBooks = queryExecute("
			SELECT 
				id,
				title,
				author
			FROM oo_books
		",
		{},
		{
			datasource = dsn.name
		});

		return qBooks;
	}

	function getByAuthor(required author) {
		var qBooks = queryExecute("
			SELECT 
				id,
				title,
				author
			FROM oo_books
			WHERE
				author = :author
		",
		{
			author = arguments.author
		},
		{
			datasource = dsn.name
		});

		return qBooks;
	}

}