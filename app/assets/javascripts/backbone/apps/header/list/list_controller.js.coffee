@Demo.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller = 

		listHeader: ->
			# request is serviced by Handler function in entities/header.js.coffee API
			links = App.request "header:entities"

			headerView = @getHeaderView links
			App.headerRegion.show headerView

		getHeaderView: (links) ->
			new List.Headers 
				collection: links
