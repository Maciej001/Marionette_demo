@Demo = do (Backbone, Marionette) ->

	App = new Marionette.Application

	App.rootRoute = "users"

	App.on "before:start", (options) ->
		@currentUser = App.request "set:current:user", options.currentUser

	App.reqres.setHandler "get:current:user", ->
		App.currentUser

	App.addRegions
		headerRegion: 	"#header-region"
		mainRegion: 		"#main-region"
		footerRegion:		"#footer-region"

	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("FooterApp").start()

	# 'initialize:after' has been renamed to 'start'
	App.on "start", (options) ->
		if Backbone.history
			Backbone.history.start()

			# manual navigating will not cause routing action, so it will not use
			# listUsers route from UsersApp module
			# to trigger routing action you need to pass option: 'trigger: true'
			@navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

	# this code is moved to backbone/config/marionette/application.js.coffe
	# App.navigate = (route, options = {}) ->
	# 	Backbone.history.navigate route, options

	# App.getCurrentRoute = ->
	# 	Backbone.history.fragment

	App