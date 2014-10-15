(exports ? this).TimeTracking ?= {}

TimeTracking.Harvest = (->
  metadata =
    category: 'Time Tracking'
    service:  'Harvest'
    unit:     'Project'
    url:      'https://www.getharvest.com/pricing'
    updated:  '2014-10-14'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseProjects, projectsPerProject) ->
    Base.getCostsForProjects projectsPerProject, (projects) ->
      projects += baseProjects

      if      projects <= 2 then  0
      else if projects >  2 then 12
)()

`function HarvestMetadata() { return TimeTracking.Harvest.getMetadata(); }`
`function HarvestCostsForProjects(baseProjects, projectsPerProject) { return TimeTracking.Harvest.getCostsForProjects(baseProjects, projectsPerProject); }`
