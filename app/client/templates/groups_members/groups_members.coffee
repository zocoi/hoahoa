TabularTables = {}

TabularTables.Members = new Tabular.Table({
  name: "Users",
  collection: Meteor.users,
  columns: [
    {
      data: 'emails'
      title: 'Email'
      render: (value) ->
        value[0].address
      searchable: true
    }
    {data: "profile.firstName", title: "First Name"},
    {data: "profile.lastName", title: "Last Name"},
    {
      data: "groupId", title: "HOA",
      render: (val) ->
        console.log "group id", val
        group = Groups.findOne(val)
        if group
          group.name
    }
    {
      data: "createdAt", title: "Joined"
      render: (val, type, doc) ->
        if (val instanceof Date)
          moment(val).fromNow()
    }
  ],
  extraFields: ['groupId']
})

Template.registerHelper('TabularTables', TabularTables)

Template.GroupsMembers.events {}

Template.GroupsMembers.helpers {
  selector: ->
    groupId: Meteor.user().groupId
}

# GroupsMembers: Lifecycle Hooks
Template.GroupsMembers.onCreated ->

Template.GroupsMembers.onRendered ->
  "rendered"
  console.log Meteor.users.find().fetch()

Template.GroupsMembers.onDestroyed ->
