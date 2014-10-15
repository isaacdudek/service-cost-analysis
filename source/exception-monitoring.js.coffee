(exports ? this).ExceptionMonitoring ?= {}

ExceptionMonitoring.Airbrake = (->
  metadata =
    category: 'Exception Monitoring'
    service:  'Airbrake'
    unit:     'Project'
    url:      'https://airbrake.io/account/new'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseProjects, projectsPerProject) ->
    Base.getCostsForProjects projectsPerProject, (projects) ->
      projects += baseProjects

      if      projects <=  5 then  39
      else if projects <= 15 then  89
      else if projects <= 40 then 199
)()

`function AirbrakeMetadata() { return ExceptionMonitoring.Airbrake.getMetadata(); }`
`function AirbrakeCostsForProjects(baseProjects, projectsPerProject) { return ExceptionMonitoring.Airbrake.getCostsForProjects(baseProjects, projectsPerProject); }`

ExceptionMonitoring.Bugsnag = (->
  metadata =
    category: 'Exception Monitoring'
    service:  'Bugsnag'
    unit:     'Project'
    url:      'https://bugsnag.com/pricing'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseProjects, projectsPerProject) ->
    Base.getCostsForProjects projectsPerProject, (projects) ->
      projects += baseProjects

      if      projects <= 1 then  0
      else if projects <= 5 then 29
      else if projects >  5 then 99
)()

`function BugsnagMetadata() { return ExceptionMonitoring.Bugsnag.getMetadata(); }`
`function BugsnagCostsForProjects(baseProjects, projectsPerProject) { return ExceptionMonitoring.Bugsnag.getCostsForProjects(baseProjects, projectsPerProject); }`
