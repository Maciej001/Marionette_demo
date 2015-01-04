@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.User extends Entities.Model 

	class Entities.UsersCollection extends Entities.Collection
		model: Entities.User
		url: 'users' # so fetch knows from which url it gets the list of users

		# you can not directly go for users_path helper like in rails 
		# all routes are available via 'rake routes' in terminal 

	API = 
		setCurrentUser: (currentUser) ->
			new Entities.User currentUser

		getUserEntities: ->
			users = new Entities.UsersCollection

			# fetch returns AJAX object
			users.fetch()

			#return users instance
			users

	App.reqres.setHandler "set:current:user", (currentUser) ->
		API.setCurrentUser currentUser

	App.reqres.setHandler "user:entities", ->
		API.getUserEntities()