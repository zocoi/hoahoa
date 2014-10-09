# Client App Namespace
_.extend App, {}
App.helpers = {}
_.each App.helpers, (helper, key) ->
  Handlebars.registerHelper key, helper

# Global config
Accounts.ui.config(
  requestPermissions:
    facebook: ['email', 'user_about_me']
  extraSignupFields: [
    { fieldName: 'firstName', fieldLabel: 'First name' }
    { fieldName: 'lastName', fieldLabel: 'Last name' }
  ]
)


