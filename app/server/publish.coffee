#
# Meteor.publish 'items', (param1, param2) ->
#   @ready()
#   return
#

Meteor.publish 'groups', ->
  Groups.find()

Meteor.publish 'group', (slug) ->
  Groups.findOne(slug: slug)

Meteor.publish 'currentGroup', ->
  if @userId
    user = Meteor.users.findOne(@userId)
    Groups.find(user.groupId)
  else
    @ready()

Meteor.publish 'userData', ->
  if @userId
    return Meteor.users.find({ _id: @userId }, fields:
      'groupId': 1)
  else
    @ready()
  return
