component accessors="true" {
	
	property name="dsn";

	function init(dsn = "") {
		variables.dsn = arguments.dsn;

		return this;
	}

}