class @HomeController extends RouteController
  layoutTemplate: 'MasterLayout'
  waitOn: ->
    [
      @subscribe 'userData'
      @subscribe 'currentGroup'
    ]
  onBeforeAction: ->
    currentUser = Meteor.user()
    if currentUser
      group = currentUser.group()
      @redirect 'groups.show', slug: group.slug
    else
      @next()

  action: ->
    @render 'Home'
    return
