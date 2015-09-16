Template.registerHelper 'Config', -> Config

Template.registerHelper 'Users', -> Meteor.users

Template.registerHelper 'User', -> Meteor.user()

Template.registerHelper 'NCSchemas', -> NCSchemas

Template.registerHelper 'niceName', (_id)->
  if _id
    user = Meteor.users.findOne _id
  else
    user = Meteor.user()

  if user
    if user.username
      user.username
    else if typeof user.profile != 'undefined' and user.profile.firstName
      user.profile.firstName
    else if user.emails[0].address
      user.emails[0].address
    else
      'A user'

Template.registerHelper 'currentGroup', ->
  user = Meteor.user()
  if user
    user.group()

