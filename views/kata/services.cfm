<p>Service objects are an interface between our application and the data access layer (Beans,DAO, and Gateways). Service objects along with beans can also be used to encapsulate the business logic of our application. </p>

<p>The Service Layer implements the Facade design pattern. Which means it simplifies a package of components into one easy to use component. For example the a service object could combine the DAO create and update methods into a simple save method.</p>

<h4>Example: UserService.cfc</h4>
<pre>
<code class="language-cfscript">component accessors=&quot;true&quot; {
	
	property name=&quot;userDAO&quot;;

	function init(required userDAO) {
		variables.userDAO = arguments.userDAO;

		return this;
	}

	public function save(required user) {
		
		if (arguments.user.getId()) {
			userDAO.update(arguments.user);
		}
		else {
			userDAO.create(arguments.user);
		}

		return arguments.user;
	}

}</code>
</pre>

<p>The service can also be a facade for our UserGateway object. Here is an example where the service calls the gateway and creates a collection of User beans.</p>

<h4>Example: UserService.cfc</h4>
<pre>
<code class="language-cfscript">component accessors=&quot;true&quot; {
	
	property name=&quot;userDAO&quot;;
	property name=&quot;userGateway&quot;;

	function init(required userDAO,required userGateway) {
		variables.userDAO = arguments.userDAO;
		variables.userGateway = arguments.userGateway;

		return this;
	}

	public function getAll() {
		//stores the user collection
		var users = [];
		//get the user data
		var qUsers = userGateway.getAll();

		//Create a User bean for each record and add it to the collection
		for (var row in qUsers) { 
			users.append(new User(
				id = row.id,
				firstName = row.fname,
				lastName = row.lname,
				email = row.email
			));
		}

		return users;
	}

}</code>
</pre>

<p class="lead"><strong>Task:</strong> Implement Service object methods to create a facade for the BookDAO and BookGateway objects.</p>

<h5>Book.cfc</h5>

<pre class="language-cfscript"><code>component accessors="true" {
	
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
}</code></pre>

<h5>BookDAO.cfc</h5>

<pre class="language-cfscript"><code>component accessors="true" {
	
		property name="dsn";

		function init(dsn = "") {
			variables.dsn = arguments.dsn;

			return this;
		}

		public function create(required book) {

		}

		public function read(required id) {

		}

		public function update(required book) {

		}

		public function delete(required book) {

		}

	}
}</code></pre>

<h5>BookGateway.cfc</h5>

<pre class="language-cfscript"><code>component accessors="true" {
	
		property name="dsn";

		function init(dsn = "") {
			variables.dsn = arguments.dsn;

			return this;
		}

		public query function getAll() {

		}

		public query getByAuthor(required string author) {

		}

	}
}</code></pre>