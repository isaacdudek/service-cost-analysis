(exports ? this).ExceptionMonitoring ?= {}

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
