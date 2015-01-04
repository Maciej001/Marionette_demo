@Demo.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	# attach Footer object as a public object to the Show module
	class Show.Footer extends App.Views.ItemView
		template: "footer/show/templates/show_footer"

		modelEvents: 
			"change": "render"
