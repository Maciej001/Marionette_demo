do (Backbone) ->

	# this functions extend now Marionette Application, as they don't need to know
	# about Application specific instances. 
	# _.extend adds them to Marionette.Application prototype
	_.extend Backbone.Marionette.Application::, 
		navigate: (route, options = {}) ->
			Backbone.history.navigate route, options

		getCurrentRoute: ->
			Backbone.history.fragment