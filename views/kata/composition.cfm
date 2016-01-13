
<p>Composition is an Object-Oriented concept where an object is part of another object. You can create an object that is made up of multiple objects. For example a Car object may use an Engine object, Transmission object, etc. This is referred to the "HAS A" relationship. Dependency injection libraries help with managing composite objects and wires them together for you.</p>

<h4>Example: Car.cfc</h4>

<pre class="language-cfscript">
<code>component accessors=&quot;true&quot;{
	
	property name=&quot;engine&quot;&#59;
	property name=&quot;transmission&quot;&#59;

	function init(
		transmission = new Transmission(),
		engine = new Engine()
	) {
		variables.transmission = arguments.transmission&#59;
		variables.engine = arguments.engine&#59;

		return this&#59;
	}

	function start() {
		engine.start()&#59;
	}

	function drive() {
		transmission.shift(&quot;1&quot;)&#59;
		engine.accelerate()&#59;
	}
}</code></pre>

<p class="lead"><strong>Task: </strong> The car needs brakes to stop. Add in the following Object and create a method named stop that calls the decelerate method of the engine and depress method on the brakes. <strong>Bonus:</strong> write a test to check that the stop method calls the decelerate and depress methods.</p>

<pre class="language-cfscript">
<code>component displayname=&quot;Brakes&quot; accessors=&quot;true&quot; {

	//Constructor
	function init() {

		return this&#59;
	}

	function depress() {
		//this will apply the breaks
	}

}</code></pre>