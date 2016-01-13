component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("BooksService Spec", function() {

			beforeEach(function(){
					queryExecute("
						DROP TABLE IF EXISTS oo_books;
						CREATE TABLE oo_books ( 
							id int AUTO_INCREMENT PRIMARY KEY,
							title varchar(50) NOT NULL,
							author varchar(50) NOT NULL
						);

						INSERT INTO oo_books (title,author) 
						VALUES ('Treasure Island', 'Robert Louis Stevenson');

						INSERT INTO oo_books (title,author) 
						VALUES ('Moby Dick', 'Herman Melville');

						INSERT INTO oo_books (title,author) 
						VALUES ('Strange Case of Dr Jekyll and Mr Hyde', 'Robert Louis Stevenson');

						INSERT INTO oo_books (title,author) 
						VALUES ('War and Peace', 'Leo Tolstoy');
						",
						{},
						{datasource = "KATA_SANDBOX"}
					);

					var gateway = new BookGateway(dsn="KATA_SANDBOX");
					var dao = new BookDAO(dsn="KATA_SANDBOX");
					bookService = new BookService(bookDAO=dao,bookGateway=gateway);
			});

			it("The getBook method should return a populated book bean if a correct id is passed", function() {

				var book = bookService.getBook(2);

				expect(book.getId()).toBe(2);
				expect(book.getTitle()).toBe("Moby Dick");
				expect(book.getAuthor()).toBe("Herman Melville");

			});

			it("The getBook method should return a empty book bean if no id is passed", function() {

				var book = bookService.getBook();

				expect(book.getId()).toBe(0);
				expect(book.getTitle()).toBe("");
				expect(book.getAuthor()).toBe("");

			});

			it("The save method should insert new book record", function() {

				var book = new Book(title="My Test",author="Me");

				bookService.save(book);

				var q = queryExecute("select * from oo_books where id = 5",{},{datasource = "KATA_SANDBOX"});

				expect(q.title).toBe("My Test");
				expect(q.author).toBe("Me");

			});

			it("The save method should update an existing book record", function() {

				var book = new Book(3,"Some Book","Someone");

				bookService.save(book);

				var q = queryExecute("select * from oo_books where id = 3",{},{datasource = "KATA_SANDBOX"});

				expect(q.title).toBe("Some Book");
				expect(q.author).toBe("Someone");

			});

			it("The delete method should delete an existing book", function() {

				var book = new Book(id = 1);

				bookService.delete(book);

				var q = queryExecute("select * from oo_books where id = 1",{},{datasource = "KATA_SANDBOX"});

				expect(q.recordCount).toBe(0);

			});

			it("The getAll method should return a collection of books", function() {

				var books = bookService.getAll();

				expect(books.len()).toBe(4);
				expect(books[4].getTitle()).toBe("War and Peace");
				expect(books[2].getAuthor()).toBe("Herman Melville");

			});

			it("The getByAuthor method should return a collection of books for an author", function() {

				var books = bookService.getByAuthor("Robert Louis Stevenson");
				expect(books.len()).toBe(2);

				var books = bookService.getByAuthor("Leo Tolstoy");
				expect(books.len()).toBe(1);

			});

		});
	}

}