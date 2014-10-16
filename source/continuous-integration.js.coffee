(exports ? this).ContinuousIntegration ?= {}

ContinuousIntegration.CircleCI = (->
  metadata =
    category: 'Continuous Integration'
    service:  'CircleCI'
    unit:     'Container'
    url:      'https://circleci.com/pricing'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseContainers, containersPerProject) ->
    Base.getCostsForProjects containersPerProject, (containers) ->
      containers += baseContainers

      if      containers <= 1 then 19
      else if containers >  1 then 19 + containers * 50
)()

`function CircleCIMetadata() { return ContinuousIntegration.CircleCI.getMetadata(); }`
`function CircleCICostsForProjects(baseContainers, containersPerProject) { return ContinuousIntegration.CircleCI.getCostsForProjects(baseContainers, containersPerProject); }`
