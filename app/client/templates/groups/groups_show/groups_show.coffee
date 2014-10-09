ReactiveTabs.createInterface
  template: 'bootstrapTabs'
  onChange: (slug, template) ->
    console.log('[tabs] Tab has changed! Current tab:', slug)
    console.log('[tabs] Template instance calling onChange:', template)

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
  Template.GroupsShow.events
    'dropped #dropzone': uploadHandler()
    'change input.documents': uploadHandler()


Template.GroupsShow.helpers
  documents: ->
    Documents.find()
  tabs: ->
    return [
      { name: 'Messages', slug: 'messages' }
      { name: 'Documents', slug: 'documents' }
      { name: 'People', slug: 'people' }
    ]

# GroupsShow: Lifecycle Hooks
Template.GroupsShow.created = ->
  console.log "created", Template.GroupsShow

Template.GroupsShow.rendered = ->

Template.GroupsShow.destroyed = ->
