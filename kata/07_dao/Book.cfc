component accessors="true" {
	
	property name="id" type="numeric";
	property name="title" type="string";
	property name="author" type="string";

	function init(
		id = 0,
		title = "",
		author = ""
	) {
		variables.id = arguments.id;
		variables.title = arguments.title;
		variables.author = arguments.author;

		return this;
	}
}