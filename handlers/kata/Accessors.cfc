/**
* Accessors kata handler
* 
* @author Jason Steinshouer
* @title Accessors
* @description Accessors
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/04_accessors/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	setNextKata("inheritance");
	
}