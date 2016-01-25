<p>Because of Composition we have learned that objects are composed of other objects which are also composed of other objects. These are object dependecies. Dependecy Injection (DI) is also known as Inversion of Control (IOC). This is an object oriented design technique where objects do not control their own dependencies. Objects dependencies are passed to the dependent object rather than object managing the dependency itself.</p>

<h4>Example Car.cfc without DI</h4>

<pre class="language-cfscript">
<code>
component {
	
	function init() {
		variables.transmission = new Transmission();
		variables.engine = new Engine();
	}

	....

}
</code>
</pre>


<h4>Example Car.cfc with DI</h4>

<pre class="language-cfscript">
<code>
component {
	
	function init(required transmission, required engine) {
		variables.transmission = arguments.transmission;
		variables.engine = arguments.engine;
	}

	....

}
</code>
</pre>

<p>If for some reason we need to change the engine or transmission object we would just pass a differnt one and the Car component would not need to change. If we are doing test driven development we can easily mock the transmision and engine objects to test the Car component.</p>

<p>Object depenceis can be a pain to manage which is why there are software libraries dedicated to help with this problem.</p>

<p>Depency Injection is hard to manage manually. This is why there are software libraries dedicated to coliving this problem.Two popular DI libraries used in CFML are <a href="http://wirebox.ortusbooks.com/content/installing_wirebox/index.html" target="_blank">Wirebox</a> and <a href="https://github.com/framework-one/di1" target="_blank">DI/1</a>. Wirebox uses an custom attribute named inject on a property or argument to "autowire" dependencies into your objects. Here are some examples.</p>

<h4>Wirebox Example Properties: Car.cfc</h4>

<pre class="language-cfscript">
<code>
component accessors="true" {
	
	property name="engine" inject="engines.V6Engine";
	property name="transmission" inject="transimissions.AutomaticTransmission";

	....

}
</code>
</pre>

<h4>Wirebox Example arguments: Car.cfc</h4>

<pre class="language-cfscript">
<code>
component accessors="true" {
	
	property name="engine";
	property name="transmission";

	/**
	* Constructor
	* 
	* @engine.inject engines.V6Engine
	* @transmission.inject transmissions.ManualTransmission
	*/
	function init(
		required transmission,
		required engine
	) {
		variables.transmission = arguments.transmission;
		variables.engine = arguments.engine;
	}

	....

}
</code>
</pre>

<p>When a Car object is created Wirebox will also create the appropriate engine and transmission objects and inject them into the Car object.</p>

<h4>Some Resources</h4>
<ul>
	<li><a href="https://en.wikipedia.org/wiki/Dependency_injection" target="_blank">https://en.wikipedia.org/wiki/Dependency_injection</a></li>
	<li><a href="http://wirebox.ortusbooks.com/content/" target="_blank">http://wirebox.ortusbooks.com/content/</a></li>
	<li><a href="http://ortus-public.s3.amazonaws.com/cbox202-unit1-3.pdf" target="_blank">http://ortus-public.s3.amazonaws.com/cbox202-unit1-3.pdf</a></li>
</ul>

<p class="lead"><strong>Task:</strong> Use wirebox to inject the component kata.oo.di.BookService into a property named bookService. Then create a method getBooksAsJSON. This methods should call the getAll method of bookService and serialize it as a JSON string.</p>



