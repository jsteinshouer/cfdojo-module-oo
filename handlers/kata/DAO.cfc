/**
* OO DAO kata handler
* 
* @author Jason Steinshouer
* @title Data Access Objects
* @description Data Access Objects
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/07_dao/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	setNextKata("gateways");
}