component {
	
	property name="id" type="numeric";
	property name="title" type="string";
	property name="dueDate" type="date";
	property name="isComplete" type="boolean";

	public function init(
		id = 0,
		title = "",
		dueDate	= "",
		isComplete = false
	){
		
		variables.id = arguments.id;
		variables.title = arguments.title;
		variables.dueDate = arguments.dueDate;
		variables.isComplete = arguments.isComplete;

		return this;
	}

}