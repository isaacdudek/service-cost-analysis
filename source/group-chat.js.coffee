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

GroupChat.HipChat = (->
  metadata =
    category: 'Group Chat'
    service:  'HipChat'
    unit:     'User'
    url:      'https://www.hipchat.com/pricing'
    updated:  '2014-10-20'

  getMetadata: (type) ->
    Base.getMetadata metadata, type

  getCostsForProjects: (type, baseUsers, usersPerProject) ->
    Base.getCostsForProjects usersPerProject, (users) ->
      users += baseUsers

      switch type
        when 'Basic'
          0
        when 'Plus'
          users * 2
)()

`function HipChatMetadata(type) { return GroupChat.HipChat.getMetadata(type); }`
`function HipChatCostsForProjects(type, baseUsers, usersPerProject) { return GroupChat.HipChat.getCostsForProjects(type, baseUsers, usersPerProject); }`
