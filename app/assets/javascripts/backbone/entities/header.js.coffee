# assets/javascript/backbone/entities/header.js.coffee
# Here we move our header item and header collection

@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Header extends Entities.Model

	class Entities.HeaderCollection extends Entities.Collection
		model: Entities.Header

	API = 
		getHeaders: ->
			new Entities.HeaderCollection [
				{ name: "Users", url: Routes.users_path() }
				{ name: "Leads", url: Routes.leads_path() }
				{ name: "Appointments", "appointments" }
			]

	App.reqres.setHandler "header:entities", ->
		API.getHeaders()
