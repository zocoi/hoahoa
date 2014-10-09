@Groups = new Mongo.Collection('groups')

Schemas = {}

Schemas.Groups = new SimpleSchema
  name:
    type: String
    label: "HOA name"
  slug:
    type: String


if Meteor.isServer
  Groups.allow
    insert: (userId, doc) ->
      false
    update: (userId, doc, fieldNames, modifier) ->
      false
    remove: (userId, doc) ->
      false

  Groups.deny
    insert: (userId, doc) ->
      true
    update: (userId, doc, fieldNames, modifier) ->
      true
    remove: (userId, doc) ->
      true

Groups.attachSchema Schemas.Groups