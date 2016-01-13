
<p>Beans as well as other types of objects use accessors otherwise known as setters and getters. Accessors are methods that used to change property values and read property values. For example we could have a method name <code>setUserId</code> to change the value of our userId property. There would also be a method named <code>getUserId</code> to read the current value of the userId property.</p>

<p>Starting with Coldfusion 9 your components can have accessors automatically created by setting the component accessors attrubute to true. i.e. <code>accessors="true"</code></p>

<p>Some properties you may not want to allow the properties to change externally. In that case you set the setter attribute for the property to false. In the example below a getter and setter method with be available for each property except active. The active property will only have a getter method.</p>

<h4>Example Bean: User.cfc</h4>

<pre class="language-cfscript">
<code>/*  User.cfc */
component accessors=&quot;true&quot; {
	/* User Properties */
	property name=&quot;id&quot;&#59;
	property name=&quot;userId&quot;&#59;
	property name=&quot;firstName&quot;&#59;
	property name=&quot;lastName&quot;&#59;
	property name=&quot;email&quot;&#59;
	property name=&quot;phone&quot;&#59;
	property name=&quot;active&quot; setter=&quot;false&quot;&#59;
}</code></pre>

<p>The default accessors can also be overridden by defining the function in the component. A use case may be to add some extra validation to properties before they are set.</p>

<p class="lead"><strong>Task: </strong>  Add a new boolean property to our Task bean named pastDue that default to false. This property should have a get accessor but not a set accessor. The pastDue property should be true when dueDate is prior to to the current date.</p>