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

			kata = [
				{
					id = "intro",
					title = "Intro",
					description = "Introduction to Object-Oriented Programming in Coldfusion",
					path = "kata/01_intro"
				},
				{
					id = "beans",
					title = "Beans",
					description = "What is a Bean?",
					path = "kata/02_beans"
				},
				{
					id = "constructor",
					title = "Constructor",
					description = "Constructor",
					path = "kata/03_constructor"
				},
				{
					id = "accessors",
					title = "Accessors",
					description = "Property accessors",
					path = "kata/04_accessors"
				},
				{
					id = "inheritance",
					title = "Inheritance",
					description = "IS A Relationships",
					path = "kata/05_inheritance"
				},
				{
					id = "composition",
					title = "Composition",
					description = "HAS A Relationships",
					path = "kata/06_composition"
				},
				{
					id = "dao",
					title = "Data Access Objects",
					description = "Database CRUD",
					path = "kata/07_dao"
				},
				{
					id = "gateways",
					title = "Gateways",
					description = "Working with record sets",
					path = "kata/08_gateways"
				},
				{
					id = "services",
					title = "Services",
					description = "Service Layer",
					path = "kata/09_services"
				},
				{
					id = "di",
					title = "Dependecy Injection",
					description = "Inversion of Control",
					path = "kata/10_di"
				}
			]
			
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
			{pattern="/kata/:id/run", handler = "kata", action="run" },
			{pattern="/kata/:id/submit", handler = "kata", action="submit" },
			{pattern="/kata/:id", handler = "kata", action="index" },
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

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}