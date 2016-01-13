component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("Task Spec", function() {

			it("Task should contain an id property ", function() {
				var task = new Task();
				task.setId(1)

				expect(task.getId()).toBe(1);
			});

			it("Task should contain an title property ", function() {
				var task = new Task();
				task.setTitle("To Do: Get Stuff Done");
				expect(task.getTitle()).toBe("To Do: Get Stuff Done");
			});

			it("Task should contain an dueDate property ", function() {
				var task = new Task();
				var due = now();
				task.setDueDate(due)
				expect(task.getDueDate()).toBe(due);
			});

			it("Task should contain an iscomplete property ", function() {
				var task = new Task();
				task.setIsComplete(true);
				
				expect(task.getIsComplete()).toBeTrue();
			});

			it("The isComplete property should only store boolean values", function() {
				var task = new Task();

				task.setIsComplete(5);
				expect(task.getIsComplete()).toBeTrue();

				expect(function() {task.setIsComplete("this should throw an error");}).toThrow();
			});


		});
	}

}