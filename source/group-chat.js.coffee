(exports ? this).GroupChat ?= {}

GroupChat.Flowdock = (->
  metadata =
    category: 'Group Chat'
    service:  'Flowdock'
    unit:     'User'
    url:      'https://www.flowdock.com/pricing'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseUsers, usersPerProject) ->
    Base.getCostsForProjects usersPerProject, (users) ->
      users += baseUsers

      if      users <= 5 then 0
      else if users >  5 then users * 3
)()

`function FlowdockMetadata() { return GroupChat.Flowdock.getMetadata(); }`
`function FlowdockCostsForProjects(baseUsers, usersPerProject) { return GroupChat.Flowdock.getCostsForProjects(baseUsers, usersPerProject); }`
