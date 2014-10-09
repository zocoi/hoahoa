@Homes = new Mongo.Collection('homes')

Schemas = {}

Schemas.Homes = new SimpleSchema
  name:
    type: String
  members:
    type: [Object]
  "members.$.name":
    type: String
  "members.$.homePhone":
    type: String
  "members.$.cellPhone":
    type: String
  "members.$.email":
    type: String
  "members.$.userId":
    type: String
    optional: true
    autoValue: ->
      if @isInsert
        Meteor.userId()
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id
  groupId:
    type: String
    regEx: SimpleSchema.RegEx.Id
    optional: false
    autoform:
      options: ->
        _.map Groups.find().fetch(), (group)->
          label: group.name
          value: group._id


if Meteor.isServer
  Homes.allow
    insert: (userId, doc) ->
      false
    update: (userId, doc, fieldNames, modifier) ->
      false
    remove: (userId, doc) ->
      false

  Homes.deny
    insert: (userId, doc) ->
      true
    update: (userId, doc, fieldNames, modifier) ->
      true
    remove: (userId, doc) ->
      true

Homes.attachSchema Schemas.Homes
