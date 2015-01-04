@Demo.module "Views", (Views, App, Backbone, Marionette, $, _) ->
	
	_.extend Marionette.View::, 

		templateHelpers: ->
			currentUser:
				App.request("get:current:user").toJSON()

			linkTo: (name, url, options = {}) ->
				# when we removed the # in our _header.jst.eco we get incorect routes without /#/
				# so it is time to implement _.defaults options
				# external means the link is external

				_.defaults options,
					external: false

				url = "#" + url unless options.external

				"<a href='#{url}'>#{@escape(name)}</a>"
