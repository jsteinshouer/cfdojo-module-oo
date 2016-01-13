component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("BooksGateway Spec", function() {

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
			});

			it("The getAll method should return all records", function() {
				var gateway = new BookGateway(dsn="KATA_SANDBOX");


				var qBooks = gateway.getAll();

				expect(qBooks.recordCount).toBe(4);
				expect(qBooks.title[4]).toBe("War and Peace");
				expect(qBooks.author[2]).toBe("Herman Melville");

			});

			it("The getByAuthor method should return records for an author", function() {
				var gateway = new BookGateway(dsn="KATA_SANDBOX");


				var qBooks = gateway.getByAuthor("Robert Louis Stevenson");
				expect(qBooks.recordCount).toBe(2);

				var qBooks = gateway.getByAuthor("Leo Tolstoy");
				expect(qBooks.recordCount).toBe(1);

			});

		});
	}

}