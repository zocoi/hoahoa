Template._loginButtonsLoggedInDropdown.events
  "click #login-buttons-edit-profile": (event) ->
    event.stopPropagation()
    Template._loginButtons.toggleDropdown()
    Router.go "users.profile"
