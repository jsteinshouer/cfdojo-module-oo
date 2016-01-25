component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("My Solution", function() {

			// executes before all suites
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

				var injector = new coldbox.system.ioc.Injector();
				var binder = new MyBinder(injector);

				mySolution = injector.getInstance("kata.oo.di.MySolution");
			});

			it("getBooksAsJSON should return a json string", function() {

				expect(isJSON(mySolution.getBooksAsJSON())).toBe(true);
			});

			it("getBooksAsJSON should return 4 books", function() {

				var books = deserializeJSON(mySolution.getBooksAsJSON());

				expect(books.len()).toBe(4);
				expect(books[2].title).toBe("Moby Dick");
			});

			it("The bookService property should be populated with wirebox", function() {

				var property = {};

				for(var item in getMetadata(mySolution).properties) {
					if (item.name == "bookService") {
						var property = item;
					}
				}

				expect(property.name).toBe("bookService");
				expect(property.inject).toBe("kata.oo.di.BookService");
			});

			it("The component should not use the new keyword", function() {

				var content = fileRead("ram://kata/oo/di/MySolution.cfc");

				expect(findNoCase("new kata.oo.di.BookService()",content)).toBe(0);
				expect(findNoCase("new BookService()",content)).toBe(0);


			});

		});
	};

}