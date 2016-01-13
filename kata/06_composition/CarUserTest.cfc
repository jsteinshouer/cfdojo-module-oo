component extends="testbox.system.BaseSpec" {


	// All suites go in here
	function run( testResults, testBox ){
		// Make all tests pass
		describe("Car Spec", function() {


			it("Car should start by starting the engine", function() {
				var engine = getMockBox().prepareMock(new Engine());
				engine.$("start");
				var car = new Car(engine=engine);

				car.start();

				/* Engine start should be called once */
				expect(engine.$once("start")).toBe(true);
			});

			it("Car should drive shifting to first gear and accelerating the engine", function() {
				var engine = getMockBox().prepareMock(new Engine());
				engine.$("accelerate");
				var transmission = getMockBox().prepareMock(new Transmission());
				/* Should shift to first gear */
				transmission.$("shift",1);
				var car = new Car(
					engine = engine,
					transmission = transmission
				);

				car.drive();

				expect(transmission.$once("shift")).toBe(true);
				expect(engine.$once("accelerate")).toBe(true);
			});

			it("Car should contain a stop method", function() {
				var car = new Car();

				expect(structKeyExists( car, "stop" )).toBe(true);
			});

		});
	}

}