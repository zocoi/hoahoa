Router.configure
  layoutTemplate: 'MasterLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'

Router.route '/',
  name: 'home', where: 'client'

Router.route '/groups/:slug',
  name: 'groups.show'
  controller: 'GroupsShowController'
  where: 'client'

Router.route '/groups/:slug/members',
  name: 'groups.members'
  controller: 'GroupsMembersController'
  where: 'client'
