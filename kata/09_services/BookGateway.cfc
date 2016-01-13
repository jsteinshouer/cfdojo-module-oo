component accessors="true" {
	
	property name="dsn";

	function init(dsn = "") {
		variables.dsn = arguments.dsn;

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
			datasource = dsn
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
			datasource = dsn
		});

		return qBooks;
	}

}