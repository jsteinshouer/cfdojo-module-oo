
<p>The term Bean originates from Java programing. It is an object that represents some entity in your application. </p>

<h4>But what is it really?</h4>

<blockquote>
	<p>Typically, a ColdFusion bean is a single CFC built to encapsulate and store a single
	record of data, and not a recordset query result, which would normally hold more
	than one record. This is not to say that the information within the Bean should only
	be pulled from one record within a database table, or that the data needs to be only a
	single string—far from it.</p>

	<p>You can include information in your Bean from any source at your disposal;
	however, the Bean can only ever contain one set of information.</p>

	<p>The Bean holds information about the entity it is written for. Imagine we have a Bean
	to represent a person, and this Bean will hold details on that individual's name, age,
	hair color, and so on. These details are the properties for the entity, and together they
	make up the completed Bean for that person.</p>

	<footer>Matt Gifford <cite title="Source Title">Object-Oriented Programming in Coldfusion</cite></footer>
</blockquote>

<h4>Example Bean: User.cfc</h4>

<pre class="language-cfscript">
<code>
/*  User.cfc */
component accessors=&quot;true&quot; {
	/* User Properties */
	property name=&quot;id&quot;&#59;
	property name=&quot;userId&quot;&#59;
	property name=&quot;firstName&quot;&#59;
	property name=&quot;lastName&quot;&#59;
	property name=&quot;email&quot;&#59;
	property name=&quot;phone&quot;&#59;
}
</code>
</pre>

<p>It is important to notice that the properties for the component represent data about a single user record. Properties are stored in component's variables scope.</p>

<p class="lead"><strong>Task: </strong>  Create a Task component with id, title, dueDate, and isComplete properties </p>

