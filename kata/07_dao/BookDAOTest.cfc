component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("BooksDAO Spec", function() {

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
						",
						{},
						{datasource = "KATA_SANDBOX"}
					);
			});

			it("The create method should insert a new record", function() {
				var dao = new BookDAO(dsn="KATA_SANDBOX");

				var book = new Book(
					title = "Object-Oriented Programming in Coldfusion",
					author = "Matt Gifford"
				);

				dao.create(book);

				expect(book.getId()).toBe(3);
				
				var q = queryExecute("select * from oo_books where id = 3",{},{datasource = "KATA_SANDBOX"});

				expect(q.title).toBe("Object-Oriented Programming in Coldfusion");

			});

			it("The read method should return a populated Book bean", function() {
				var dao = new BookDAO(dsn="KATA_SANDBOX");

				var book1 = dao.read(1);

				expect(book1.getTitle()).toBe("Treasure Island");
				expect(book1.getAuthor()).toBe("Robert Louis Stevenson");

				var book2 = dao.read(2);

				expect(book2.getTitle()).toBe("Moby Dick");
				expect(book2.getAuthor()).toBe("Herman Melville");
			});

			it("The update method should update a record", function() {
				var dao = new BookDAO(dsn="KATA_SANDBOX");

				queryExecute("INSERT INTO oo_books (title,author) VALUES ('Some Book', 'Someone');",{},{datasource = "KATA_SANDBOX"});

				

				var book = new Book(
					id = 3,
					title = "Hello World",
					author = "Me"
				);

				dao.update(book);
				
				var q = queryExecute("select * from oo_books where id = 3",{},{datasource = "KATA_SANDBOX"});

				expect(q.title).toBe("Hello World");
				expect(q.author).toBe("Me");

			});

			it("The delete method should remove a record", function() {
				var dao = new BookDAO(dsn="KATA_SANDBOX");

				var book = new Book(
					id = 2
				);

				dao.delete(book);
				
				var q = queryExecute("select * from oo_books where id = 2",{},{datasource = "KATA_SANDBOX"});

				expect(q.recordCount).toBe(0);

			});
		});
	}

}