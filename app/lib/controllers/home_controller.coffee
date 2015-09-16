class @HomeController extends RouteController
  layoutTemplate: 'MasterLayout'
  waitOn: ->
    [
      @subscribe 'currentGroup'
    ]
  onBeforeAction: ->
    if Meteor.userId()
      currentUser = Meteor.user()
      group = currentUser.group()
      @redirect 'groups.show', slug: group.slug
    else
      @next()

  action: ->
    @render 'Home'
    return

