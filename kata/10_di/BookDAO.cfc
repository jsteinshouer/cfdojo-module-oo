component accessors="true" {
	
	property name="dsn";

	function init() {

		setDSN({name="KATA_SANDBOX"});
		
		return this;
	}

	public function create(required book) {
		queryExecute("
			INSERT INTO oo_books(title,author) 
			VALUES (
				:title,
				:author
			)
		",
		{
			title = arguments.book.getTitle(),
			author = arguments.book.getAuthor()
		},
		{
			datasource = dsn.name,
			result = "qInsert"
		});

		arguments.book.setId(qInsert.generatedKey);

		return arguments.book;
	}

	public function read(required id) {
		var qBook = queryExecute("
			SELECT 
				id,
				title,
				author
			FROM oo_books
			WHERE
				id = :id
		",
		{
			id = arguments.id
		},
		{
			datasource = dsn.name
		});

		var book = new Book(
			id = qBook.id,
			title = qBook.title,
			author = qBook.author
		);

		return book;
	}

	public function update(required book) {
		var qUpdate = queryExecute("
			UPDATE oo_books
			SET
				title =	:title,
				author = :author
			WHERE
				id = :id
		",
		{
			id = arguments.book.getId(),
			title = arguments.book.getTitle(),
			author = arguments.book.getAuthor()
		},
		{
			datasource = dsn.name
		});

		return arguments.book;
	}

	public void function delete(required book) {
		queryExecute("
			DELETE
			FROM oo_books
			WHERE
				id = :id
		",
		{
			id = arguments.book.getId()
		},
		{
			datasource = dsn.name
		});
	}

}