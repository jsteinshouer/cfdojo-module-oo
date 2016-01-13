component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("Task Spec", function() {

			it("Task constructor should initialize the object with default values", function() {
				var task = new Task();

				expect(task.getId()).toBe(0);
				expect(task.getTitle()).toBe("");
			});

			it("Task constructor should allow properties to populated with arguments", function() {
				var now = now();

				var task = new Task(
					id = 123,
					title = "To Do",
					dueDate = now
				);
				expect(task.getId()).toBe(123);
				expect(task.getTitle()).toBe("To Do");
				expect(task.getDueDate()).toBe(now);
				/* We did not pass the isComplete arg so it should default to false */
				expect(task.getIsComplete()).toBe(false);
			});


		});
	}

}