/**
* OO Constructor kata handler
* 
* @author Jason Steinshouer
* @title Constructor
* @description Constructor Method
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/03_constructor/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	setNextKata("accessors");
	
}