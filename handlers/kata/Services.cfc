/**
* OO Services kata handler
* 
* @author Jason Steinshouer
* @title Services
* @description Service Layer
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/09_services/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	
}