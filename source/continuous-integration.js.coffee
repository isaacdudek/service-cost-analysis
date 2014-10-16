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

ContinuousIntegration.TravisCI = (->
  metadata =
    category: 'Continuous Integration'
    service:  'Travis CI'
    unit:     'Concurrent Job'
    url:      'https://travis-ci.com/plans'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseConcurrentJobs, concurrentJobsPerProject) ->
    Base.getCostsForProjects concurrentJobsPerProject, (concurrentJobs) ->
      concurrentJobs += baseConcurrentJobs

      if      concurrentJobs <=  2 then 129
      else if concurrentJobs <=  5 then 249
      else if concurrentJobs <= 10 then 489
)()

`function TravisCIMetadata() { return ContinuousIntegration.TravisCI.getMetadata(); }`
`function TravisCICostsForProjects(baseConcurrentJobs, concurrentJobsPerProject) { return ContinuousIntegration.TravisCI.getCostsForProjects(baseConcurrentJobs, concurrentJobsPerProject); }`
