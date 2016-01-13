component accessors="true"{
	
	property name="engine";
	property name="transmission";

	function init(
		transmission = new Transmission(),
		engine = new Engine()
	) {
		variables.transmission = arguments.transmission;
		variables.engine = arguments.engine;

		return this;
	}

	function start() {
		engine.start();
	}

	function drive() {
		transmission.shift(1);
		engine.accelerate();
	}
}