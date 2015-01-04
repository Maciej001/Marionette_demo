@Demo.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller = 
		
		listUsers: ->
			users = App.request "user:entities"

			@layout = @getLayoutView()

			# regions are available only after layout has been inserted into a DOM
			# so everything here will happen only after @layout has been inserted
			# fat arrow is to prevent context in coffeescript. We want to keep context 
			# of the controller and not of the show event. 
			@layout.on "show", =>

				# both views will have access to users and still will recieve the same events
				# to handle
				@showPanel users
				@showUsers users

			App.mainRegion.show @layout

		showPanel: (users) ->
			panelView = @getPanelView users
			@layout.panelRegion.show panelView 

		showUsers: (users) ->
			usersView = @getUsersView users
			@layout.usersRegion.show usersView

		getUsersView: (users) ->
			new List.Users 
				collection: users

		getPanelView: (users) ->
			new List.Panel 
				collection: users 

		getLayoutView: ->
			new List.Layout
