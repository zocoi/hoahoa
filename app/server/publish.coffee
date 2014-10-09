#
# Meteor.publish 'items', (param1, param2) ->
#   @ready()
#   return
#

Meteor.publish 'groups', ->
  Groups.find()

Meteor.publish 'group', (slug) ->
  Groups.findOne(slug: slug)

Meteor.publish 'documents', ->
  Documents.find()
