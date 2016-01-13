/**
* Composition kata handler
* 
* @author Jason Steinshouer
* @title Composition
* @description Composition
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/06_composition/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	setNextKata("dao");
	
}