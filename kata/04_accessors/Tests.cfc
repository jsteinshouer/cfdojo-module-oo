component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("Task Spec", function() {

			it("The pastDue property should default to false", function() {
				var task = new Task();

				expect(task.getPastDue()).toBe(false);
			});

			it("Trying to set the pastDue property should throw an error", function() {
				var task = new Task();

				expect(function() {
					task.setPastDue(true);
				}).toThrow();

				expect(task.getPastDue()).toBe(false);
			});

			it("pastDue should be true if the due date was in the past", function() {
				var yesterday = dateAdd("d",-1,now());

				var task = new Task();

				task.setDueDate(yesterday);
				expect(task.getPastDue()).toBe(true);
	
			});


		});
	}

}