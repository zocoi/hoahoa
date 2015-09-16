class @GroupsController extends RouteController

  subscriptions: ->

  waitOn: ->
    @subscribe('currentGroup')

  data: ->
    return unless @ready()
    group = Meteor.user().group()
    group

  onRun: ->
    @next()
  onRerun: ->
    @next()
  onBeforeAction: ->
    @next()

  action: ->
    @render()
  onAfterAction: ->
  onStop: ->
