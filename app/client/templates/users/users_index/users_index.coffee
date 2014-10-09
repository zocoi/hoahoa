
# UsersIndex: Event Handlers and Helpers
Template.UsersIndex.events
# Example:
#  "click .selector": (e, tmpl) ->
#

Template.UsersIndex.helpers
  users: ->
    Meteor.users.find()

# UsersIndex: Lifecycle Hooks
Template.UsersIndex.created = ->

Template.UsersIndex.rendered = ->

Template.UsersIndex.destroyed = ->
