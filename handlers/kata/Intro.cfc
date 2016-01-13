/**
* OO Intro kata handler
* 
* @author Jason Steinshouer
* @title Intro
* @description Introduction to Object-Oriented Programming in Coldfusion
*/
component extends="handlers.kata.Base" singleton="true" {

	setConfigFile("#getDirectoryFromPath("/")#modules/oo/kata/01_intro/kata.json");
	setBaseUrl("/index.cfm/oo/kata");
	setNextKata("beans");
	
}