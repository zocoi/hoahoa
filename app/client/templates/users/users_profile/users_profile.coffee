
# UsersProfile: Event Handlers and Helpers
Template.UsersProfile.events
# Example:
#  "click .selector": (e, tmpl) ->
#

Template.UsersProfile.helpers
  currentUser: currentUserHelper = ->
    Meteor.user()

# UsersProfile: Lifecycle Hooks
Template.UsersProfile.created = ->

Template.UsersProfile.rendered = ->

Template.UsersProfile.destroyed = ->

AutoForm.hooks
  updateProfile:
    onSuccess: (operation, result, template)->
      Alert.success 'Profile picture updated'
    onError: (operation, error, template)->
      Alert.error 'Profile picture updated'
  updatePicture:
    onSuccess: (operation, result, template)->
      App.alertSuccess 'Picture Updated'
    onError: (operation, error, template)->
      App.alertError error
