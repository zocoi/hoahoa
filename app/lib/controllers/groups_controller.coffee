class @GroupsController extends RouteController

  subscriptions: ->

  waitOn: ->
    [
      @subscribe('currentGroup'),
      @subscribe('userData')
    ]


  data: ->
    return unless @ready()
    group = Meteor.user().group()
    console.log "group", group, Meteor.user()
    group

  onRun: ->
    @next()
  onRerun: ->
    @next()
  onBeforeAction: ->
    unless Meteor.userId()
      @redirect 'home'
    else
      @next()

  action: ->
    @render()
  onAfterAction: ->
  onStop: ->
