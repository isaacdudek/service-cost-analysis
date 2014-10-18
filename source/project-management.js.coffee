(exports ? this).ProjectManagement ?= {}

ProjectManagement.Asana = (->
  metadata =
    category: 'Project Management'
    service:  'Asana'
    unit:     'Member'
    url:      'https://asana.com/pricing'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseMembers, membersPerProject) ->
    Base.getCostsForProjects membersPerProject, (members) ->
      members += baseMembers

      if      members <=  15 then  50
      else if members <=  30 then 100
      else if members <=  50 then 300
      else if members <=  75 then 550
      else if members <= 100 then 800
)()

`function AsanaMetadata() { return ProjectManagement.Asana.getMetadata(); }`
`function AsanaCostsForProjects(baseMembers, membersPerProject) { return ProjectManagement.Asana.getCostsForProjects(baseMembers, membersPerProject); }`

ProjectManagement.PivotalTracker = (->
  metadata =
    category: 'Project Management'
    service:  'Pivotal Tracker'
    unit:     'Private Project'
    url:      'http://www.pivotaltracker.com/why-tracker/pricing'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (basePrivateProjects, privateProjectsPerProject) ->
    Base.getCostsForProjects privateProjectsPerProject, (privateProjects) ->
      privateProjects += basePrivateProjects

      if      privateProjects <=  5 then  7
      else if privateProjects <= 10 then 18
      else if privateProjects >  10 then 50
)()

`function PivotalTrackerMetadata() { return ProjectManagement.PivotalTracker.getMetadata(); }`
`function PivotalTrackerCostsForProjects(basePrivateProjects, privateProjectsPerProject) { return ProjectManagement.PivotalTracker.getCostsForProjects(basePrivateProjects, privateProjectsPerProject); }`

ProjectManagement.Sprintly = (->
  metadata =
    category: 'Project Management'
    service:  'Sprintly'
    unit:     'Project'
    url:      'http://sprint.ly/pricing/'
    updated:  '2014-10-18'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseProjects, projectsPerProject) ->
    Base.getCostsForProjects projectsPerProject, (projects) ->
      projects += baseProjects

      if      projects <= 1 then 10
      else if projects >  1 then 19
)()

`function SprintlyMetadata() { return ProjectManagement.Sprintly.getMetadata(); }`
`function SprintlyCostsForProjects(baseProjects, projectsPerProject) { return ProjectManagement.Sprintly.getCostsForProjects(baseProjects, projectsPerProject); }`

ProjectManagement.Waffle = (->
  metadata =
    category: 'Project Management'
    service:  'Waffle'
    unit:     'User'
    url:      'https://waffle.io/pricing'
    updated:  '2014-10-14'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseUsers, usersPerProject) ->
    Base.getCostsForProjects usersPerProject, (users) ->
      users += baseUsers

      users * 7
)()

`function WaffleMetadata() { return ProjectManagement.Waffle.getMetadata(); }`
`function WaffleCostsForProjects(baseUsers, usersPerProject) { return ProjectManagement.Waffle.getCostsForProjects(baseUsers, usersPerProject); }`
