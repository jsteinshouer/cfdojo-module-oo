
<p>The constructor is a method that is called to intialize an object. For CFML components this is the <code>init</code> method. It is good practice intialize the properties of a bean with default values using the init method. This allows beans to be initialized with or without property values.</p>

<p>Here we build on our Employee.cfc bean from the previous exercise by adding a constructor.</p>

<h4>Example Bean: Employee.cfc</h4>

<pre class="language-cfscript">
<code>component accessors=&quot;true&quot; {
	//Employee Properties
	property name=&quot;id&quot;&#59;
	property name=&quot;userId&quot;&#59;
	property name=&quot;firstName&quot;&#59;
	property name=&quot;lastName&quot;&#59;
	property name=&quot;email&quot;&#59;
	property name=&quot;phone&quot;&#59;

	function init(
		id = &quot;0&quot;,
		userId = &quot;&quot;,
		firstName = &quot;&quot;,
		lastName = &quot;&quot;,
		email = &quot;&quot;,
		phone = &quot;&quot;
	) {

		variables.id = arguments.id&#59;
		variables.userId = arguments.userId&#59;
		variables.firstName = arguments.firstName&#59;
		variables.lastName = arguments.lastName&#59;
		variables.email = arguments.email&#59;
		variables.phone = arguments.phone&#59;

		return this&#59;
	}
}</code>
</pre>

<p>It is also important to note that the constructor returns <code>this</code> which is a reference to the instance of the object being intialized.</p>

<p class="lead"><strong>Task: </strong>  Add a constructor to the Task component. </p>

