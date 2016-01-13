<p>Gateway objects are similar to DAO in that they can be used to encapsulate access to the database layer. The difference is that a DAO handles single-record transactions and Gateways work with getting record sets from the database.</p>

<blockquote>
	<p>A Gateway is an object that encapsulates access to an external system or resource.</p>

	<footer><cite title="Source Title">Martin Fowler</cite></footer>
</blockquote>

<p>This means that Gateways can be used for ecapsulating data access to data sources such as web services or other external api as well.</p>

<h4>Example UserGateway.cfc</h4>
<pre>
<code class="language-cfscript">component accessors=&quot;true&quot; {
	
	property name=&quot;dsn&quot;;

	function init(dsn = &quot;&quot;) {
		variables.dsn = arguments.dsn;

		return this;
	}

	public query function getAll() {
		
		var qUsers = queryExecute(&quot;
			SELECT 
				id,
				fname,
				lname,
				email,
				department
			FROM users
		&quot;,
		{},
		{
			datasource = dsn
		});

		return qUsers;
	}

	public query function getByDepartment(required department) {
		
		var qUsers = queryExecute(&quot;
			SELECT 
				id,
				fname,
				lname,
				email,
				department
			FROM users
			WHERE
				department = :department
		&quot;,
		{
			department = arguments.department
		},
		{
			datasource = dsn
		});

		return qUsers;
	}


}</code>
</pre>

<p>There are variations on the Gateway and DAO design pattern but this is how it is commonly implemented in CFML. The benefit to having the DAO and Gateway seperate is it futher seperates concerns and should result in two smaller, easier to maintain, components.</p>

<p class="lead"><strong>Task:</strong> Implement the a Gateway object for our books table. It should have a getAll method and a getByAuthor method. </p>

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
		<tr>
			<td>3</td>
			<td>Strange Case of Dr Jekyll and Mr Hyde</td>
			<td>Robert Louis Stevenson</td>
		</tr>
		<tr>
			<td>4</td>
			<td>War and Peace</td>
			<td>Leo Tolstoy</td>
		</tr>
	</tbody>
</table>