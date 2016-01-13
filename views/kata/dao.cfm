<p>A data access object (DAO) is design patter used to seperate database operations from our application business logic.</p>

<blockquote>
	<p>A Data Access Object , also known as a DAO , is a form of an object-oriented design pattern that allows you to separate data access from standard business logic within your application. Primarily, the DAO gives you the ability to perform updates and interactions with your database from a single file, your DAO file itself.</p>

	<footer>Matt Gifford <cite title="Source Title">Object-Oriented Programming in Coldfusion</cite></footer>
</blockquote>

<p>A DAO is responsible for database Create, Read, Update, and Delete (CRUD) operations. There may be some cases where other types of database operations will be included but typically a DAO object will have 4 methods. One for each CRUD operation.</p>

<table class="table">
	<thead>
		<tr>
			<th>Method</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>create</td>
			<td>Inserts a database record with data stored in a bean object.</td>
		</tr>
		<tr>
			<td>read</td>
			<td>Gets a single records from the database and propuates a bean with the data.</td>
		</tr>
		<tr>
			<td>update</td>
			<td>Updates a database record with data stored in a bean object.</td>
		</tr>
		<tr>
			<td>delete</td>
			<td>Deletes a database record.</td>
		</tr>
	</tbody>
</table>

<h4>Example UserDAO.cfc</h4>
<pre>
<code class="language-cfscript">component accessors=&quot;true&quot; {
	
	property name=&quot;dsn&quot;;

	function init(dsn = &quot;&quot;) {
		variables.dsn = arguments.dsn;

		return this;
	}

	public function create(required user) {
		
		queryExecute(&quot;
			INSERT INTO users(fname,lname,email) 
			VALUES (
				:fname,
				:lname,
				:email
			)
		&quot;,
		{
			fname = arguments.user.getFirstName(),
			lname = arguments.user.getLastName(),
			email = arguments.user.getEmail()
		},
		{
			datasource = dsn,
			result = &quot;qInsert&quot;
		});

		arguments.user.setId(qInsert.generatedKey);

		return arguments.user;
	}

	public function read(required id) {
		
		var qUser = queryExecute(&quot;
			SELECT 
				id,
				fname,
				lname,
				email
			FROM users
			WHERE
				id = :id
		&quot;,
		{
			id = arguments.id
		},
		{
			datasource = dsn
		});

		var user = new User();

		if (qUser.recordCount) {
			user.setId(qUser.id);
			user.setFirstName(qUser.fname);
			user.setLastName(qUser.lname);
			user.setEmail(qUser.email);
		}

		return user;
	}

	public function update(required user) {
		
		var qInsert = queryExecute(&quot;
			UPDATE users
			SET
				fname =	:fname,
				lname = :lname,
				email = :email
			WHERE
				id = :id

		&quot;,
		{
			id = arguments.user.getId(),
			fname = arguments.user.getFirstName(),
			lname = arguments.user.getLastName(),
			email = arguments.user.getEmail()
		},
		{
			datasource = dsn
		});

		return arguments.user;
	}

	public function delete(required user) {
		
		var qUser = queryExecute(&quot;
			DELETE users
			WHERE
				id = :id
		&quot;,
		{
			id = arguments.id
		},
		{
			datasource = dsn
		});
	}


}</code>
</pre>

<p class="lead"><strong>Task:</strong> Implement the create, read, update, and delete methods for our BooksDAO component.</p>

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

<h5>Table: oo_books</h5>
<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>id int</th>
			<th>title varchar(50)</th>
			<th>author varchar(50)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>Treasure Island</td>
			<td>Robert Louis Stevenson</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Moby Dick</td>
			<td>Herman Melville</td>
		</tr>
	</tbody>
</table>