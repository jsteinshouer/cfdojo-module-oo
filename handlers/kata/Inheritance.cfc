/**
* Inheritance kata handler
* 
* @author Jason Steinshouer
* @title Inheritance
* @description Inheritance
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/05_inheritance/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	setNextKata("composition");
	
}