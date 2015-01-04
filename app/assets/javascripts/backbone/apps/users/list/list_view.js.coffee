@Demo.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.LayoutView
		template: "users/list/templates/list_layout"

		# define regions on the layout
		# regions are available only once the layout has been inserted into the DOM
		regions: 
			panelRegion: "#panel-region"
			usersRegion: "#users-region"

	class List.Panel extends App.Views.ItemView
		template: "users/list/templates/_panel"

		collectionEvents: 
			"add": "render"

	class List.User extends App.Views.ItemView
		template: "users/list/templates/_user"
		tagName: 	"tr"

	class List.Empty extends App.Views.ItemView
		template: "users/list/templates/_empty"
		tagName: "tr"
 
	class List.Users extends App.Views.CompositeView
		template: 					"users/list/templates/_users"
		childView: 					List.User
		emptyView: 					List.Empty
		childViewContainer: "tbody"

