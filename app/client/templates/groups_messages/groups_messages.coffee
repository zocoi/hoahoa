Template.GroupsMessages.events {}

Template.GroupsMessages.helpers {}

# GroupsMessages: Lifecycle Hooks
Template.GroupsMessages.onCreated ->

Template.GroupsMessages.onRendered ->
  document.getElementById("forum_embed").src =
    "https://groups.google.com/forum/embed/?place=forum/wisconsin999sf" +
    "&showsearch=true&showpopout=true&parenturl=" +
    encodeURIComponent(window.location.href)

Template.GroupsMessages.onDestroyed ->
