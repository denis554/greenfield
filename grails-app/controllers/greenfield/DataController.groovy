package org.greenfield

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

public class DataController {
	
	@Secured(['permitAll'])	
	def states(){
		def country = Country.get(params.country)
		def states = State.findAllByCountry(country)
		
		render states as JSON
	}

}