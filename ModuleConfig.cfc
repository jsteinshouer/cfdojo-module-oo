/**
* Module Directives as public properties
* this.title 				= "Title of the module";
* this.author 			= "Author of the module";
* this.webURL 			= "Web URL for docs purposes";
* this.description 		= "Module description";
* this.version 			= "Module Version";
* this.viewParentLookup   = (true) [boolean] (Optional) // If true, checks for views in the parent first, then it the module.If false, then modules first, then parent.
* this.layoutParentLookup = (true) [boolean] (Optional) // If true, checks for layouts in the parent first, then it the module.If false, then modules first, then parent.
* this.entryPoint  		= "" (Optional) // If set, this is the default event (ex:forgebox:manager.index) or default route (/forgebox) the framework
* 									       will use to create an entry link to the module. Similar to a default event.
* this.cfmapping			= "The CF mapping to create";
* this.modelNamespace		= "The namespace to use for registered models, if blank it uses the name of the module."
* this.dependencies 		= "The array of dependencies for this module"
* 
* structures to create for configuration
* - parentSettings : struct (will append and override parent)
* - settings : struct
* - datasources : struct (will append and override parent)
* - interceptorSettings : struct of the following keys ATM
* 	- customInterceptionPoints : string list of custom interception points
* - interceptors : array
* - layoutSettings : struct (will allow to define a defaultLayout for the module)
* - routes : array Allowed keys are same as the addRoute() method of the SES interceptor.
* - wirebox : The wirebox DSL to load and use
* 
* Available objects in variable scope
* - controller
* - appMapping (application mapping)
* - moduleMapping (include,cf path)
* - modulePath (absolute path)
* - log (A pre-configured logBox logger object for this object)
* - binder (The wirebox configuration binder)
* - wirebox (The wirebox injector)
* 
* Required Methods
* - configure() : The method ColdBox calls to configure the module.
* 
* Optional Methods
* - onLoad() 		: If found, it is fired once the module is fully loaded
* - onUnload() 	: If found, it is fired once the module is unloaded
* 
*/
component {

	// Module Properties
	this.title 				= "Object-Oriented Programing 101";
	this.author 			= "";
	this.webURL 			= "";
	this.description 		= "Kata to learn Object-Oriented programing concepts in CFML";
	this.version			= "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "oo";
	// Model Namespace
	this.modelNamespace		= "oo";
	// CF Mapping
	this.cfmapping			= "oo";
	// Module Dependencies
	this.dependencies 		= [];

	function configure(){

		// parent settings
		parentSettings = {
			
		};

		// module settings - stored in modules.name.settings
		settings = {
			
		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};

		// datasources
		datasources = {

		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler = "kata", action="list" },
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = ""
		};

		// Custom Declared Interceptors
		interceptors = [
		];

		// Binder Mappings
		// binder.map("Alias").to("#moduleMapping#.model.MyService");

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		/* Make sure data is loaded into the db. TODO: make this dynamic */
		queryExecute("

				MERGE INTO modules (id,title,description)
				VALUES('oo','Object-Oriented Programing 101','Kata to learn Object-Oriented programing concepts in CFML')
				;
				
				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('intro','Intro','Introduction to Object-Oriented Programming in Coldfusion','oo',1);

				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('beans','Beans','What is a Bean','oo',2);

				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('constructor','Constructor','Constructor Method','oo',3);

				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('accessors','Accessors','Property accessors','oo',4);

				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('inheritance','Inheritance','IS A Relationships','oo',5);

				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('composition','Composition','HAS A Relationships','oo',6);

				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('dao','Data Access Objects','Database CRUD','oo',7);

				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('gateways','Gateways','Working with record sets','oo',8);

				MERGE INTO kata (id,title,description,f_module_id,display_order)
				VALUES('services','Services','Service Layer','oo',9);

			",
			{},
			{datasource = "cfdojo"}
		);
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}