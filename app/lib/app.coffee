# App: The Global Application Namespace
@App = App = {}

@AdminConfig = AdminConfig = {
  name: 'Hoagie Admin'
  adminEmails: ['hung.dao@me.com', 'mephis1987@gmail.com']
  collections: {
    # Documents: {}
    Groups:
      tableColumns: [
        {label: 'Name', name: 'name'}
      ]
      auxCollections: ['Meteor.users']
  }
}

