/**
* Beans kata handler
* 
* @author Jason Steinshouer
* @title Beans
* @description What is a Bean?
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/02_beans/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	setNextKata("constructor");
	
}