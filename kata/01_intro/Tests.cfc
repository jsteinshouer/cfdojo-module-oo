component extends="testbox.system.BaseSpec" {

	// executes before all suites
	function beforeAll(){
		
			variables.greeting = new Greeting();

	}

	// executes after all suites
	function afterAll(){}

	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("Greeting Spec", function() {

			it("Greeting should contain a method name sayHello", function() {
				expect(structKeyExists( greeting, "sayHello" )).toBe(true);
			});

			it("sayHello method should return Hello World", function() {
				expect(greeting.sayHello()).toBe("Hello World");
			});

		});
	}

}