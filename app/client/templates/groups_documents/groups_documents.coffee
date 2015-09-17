uploadHandler = ->
  console.log "uploadHandler called"
  FS.EventHandlers.insertFiles(Documents, {
    metadata: (fileObj) ->
      return {
        owner: Meteor.userId()
        foo: "bar"
      }
    after: (error, fileObj) ->
      unless error
        console.log("Inserted", fileObj.name())
  })

# GroupsShow: Event Handlers and Helpers
Meteor.startup ->
  Template.GroupsDocuments.events
    'dropped #dropzone': uploadHandler()
    'change input.documents': uploadHandler()


Template.GroupsDocuments.helpers {}

# GroupsDocuments: Lifecycle Hooks
Template.GroupsDocuments.onCreated ->

Template.GroupsDocuments.onRendered ->

Template.GroupsDocuments.onDestroyed ->
