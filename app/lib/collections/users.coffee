Schemas = {}

Schemas.UserProfile = new SimpleSchema(
  # picture:
  #   type: String
  #   optional:true
  #   label: 'Profile picture'
  #   autoform:
  #     afFieldInput:
  #       type: 'fileUpload'
  #       collection: 'ProfilePictures'

  firstName:
    type: String
    optional: true

  lastName:
    type: String
    optional: true

  homePhone:
    type: String
    optional: true

  cellPhone:
    type: String
    optional: true

  address:
    type: String
    optional: true
)

Schemas.User = new SimpleSchema(
  emails:
    type: [Object]

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  createdAt:
    type: Date

  profile:
    type: Schemas.UserProfile
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true

  groupId:
    type: String
    regEx: SimpleSchema.RegEx.Id
    optional: true
    autoform:
      options: ->
        Meteor.subscribe("groups")
        _.map Groups.find().fetch(), (group)->
          label: group.name
          value: group._id
)

Meteor.users.attachSchema Schemas.User

Meteor.users.helpers(
  fullName: ->
    console.log "@profile", @
    @profile.firstName + ' ' + @profile.lastName
  group: ->
    group = Groups.findOne(@groupId)
)

