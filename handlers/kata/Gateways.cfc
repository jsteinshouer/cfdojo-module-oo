/**
* OO Gateways kata handler
* 
* @author Jason Steinshouer
* @title Gateways
* @description Working with record sets
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/08_gateways/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	setNextKata("services");
}