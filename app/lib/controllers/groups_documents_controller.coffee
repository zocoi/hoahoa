class @GroupsDocumentsController extends GroupsController

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
