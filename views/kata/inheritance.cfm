
<p>Inheritance is an Object-Oriented concept where a child object extends a parent object. The child  object inherits the properties and methods of the parent object. </p>

<p>In CFML this is done using the extends attribute of the component. i.e. <code class="language-cfscript">component extends="Product" { }</code></p>

<p>Inheritance is powerful but is not very flexible. Composition is another Object-Oriented concept that is more fexible and should be used in favor of Inheritance in most cases. We will discuss Composition in more detail in the next challenge. Inheritance should only be used for "IS A" relationships. For example Pizza IS-A Food.</p>

<p>The child object can also override methods and properties in the parent object. There is also a <code>super</code> keyword that is used to call methods in the parent object so you can call the parent method plus add some additional functionality. It is common to call the parent constructor using the super keyword like this example.</p>

<h4>Example: Book.cfc</h4>

<pre class="language-cfscript">
<code>component extends=&quot;Product&quot; {
	
	property name=&quot;author&quot;&#59;

	function init(author="") {
		//call the parent constructor
		super.init(argumentCollection=arguments)&#59;
		//populate author property
		variables.author = arguments.author&#59;

		return this&#59;
	}
}</code></pre>

<p class="lead"><strong>Task: </strong>  Create an Employee component that inherits from the following User component. The Employee component should also have a property named department that takes a string.</p>

<pre class="language-cfscript">
<code>component accessors=&quot;true&quot; {

	property name=&quot;userId&quot;&#59;
	property name=&quot;firstName&quot;&#59;
	property name=&quot;lastName&quot;&#59;
	property name=&quot;email&quot;&#59;

	//Constructor
	function init(
		userId = "",
		firstName = "",
		lastName = "",
		email = ""
	) {
		variables.userId = arguments.userId&#59;
		variables.firstName = arguments.firstName&#59;
		variables.lastName = arguments.lastName&#59;
		variables.email = arguments.email&#59;

		return this&#59;
	}


}</code></pre>