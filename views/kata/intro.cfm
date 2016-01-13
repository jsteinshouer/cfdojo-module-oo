
<p>Object-Oriented Programing (OOP) is a methodology used help modularize parts of an application to help it be easier to maintain. One pricipal that it promotes is DRY (Do Not Repeat Yourself). When done correctly your modules become easier to re-use throughout different parts of an application.</p>

<p>Object-Oriented Programing uses "Objects" to modularize code. In CFML a component (.cfc) file is a definition of an object which is sometimes called a class. When a component is instrantiated it becomes an object. Objects consist of data stored in properties and pulic and private methods.</p>

<pre class="language-cfscript"><code>component {

}</code></pre>

<p>Methods are defined inside a component using the following syntax</p>

<pre class="language-cfscript"><code>public/private <i>returnType</i> function <i>name</i>(<i>argumentName</i>=<i>defaultValue</i>,...) {
	...
	return;
}</code></pre>

<p>Example:</p>

<pre class="language-cfscript"><code>public string function getFullName (String firstName, String lastName) {
	var fullName = arguments.firstName & " " & arguments.lastName;
	return fullName;
}</code></pre>

<p class="lead"><strong>Task:</strong> Write a Greeting component with a method named sayHello that returns a string "Hello World"  </p>

<a href="http://www.learncfinaweek.com/week1/Components/" target="_blank">http://www.learncfinaweek.com/week1/Components/</a>

