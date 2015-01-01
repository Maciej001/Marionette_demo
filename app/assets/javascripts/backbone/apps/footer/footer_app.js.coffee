# footer_app.js.coffee

@Demo.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
  
	API =  
		showFooter: ->
			FooterApp.Show.Controller.showFooter()

	# event handler called from app.js
	FooterApp.on "start", ->
		API.showFooter()