component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("Employee Spec", function() {

			it("Employee should extend User", function() {
				var employee = new Employee();

				expect(listLast(getMetadata(employee).extends.name,".")).toBe("User");
			});

			it("Employee should contain a getUserId method", function() {
				var employee = new Employee();

				expect(structKeyExists( employee, "getUserId" )).toBe(true);
			});

			it("Employee should contain the getDepartment method", function() {
				var employee = new Employee();

				expect(structKeyExists( employee, "getDepartment" )).toBe(true);
			});

			it("Employee constructor should initialize properties", function() {
				var employee = new Employee(
					department = "IT",
					userId = "jdoe"
				);

				expect(employee.getDepartment()).toBe("IT");
				expect(employee.getUserId()).toBe("jdoe");
			});


		});
	}

}