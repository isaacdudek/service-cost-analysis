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

ContinuousIntegration.Codeship = (->
  metadata =
    category: 'Continuous Integration'
    service:  'Codeship'
    unit:     'Concurrent Build'
    url:      'https://codeship.io/pricing'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseConcurrentBuilds, concurrentBuildsPerProject) ->
    Base.getCostsForProjects concurrentBuildsPerProject, (concurrentBuilds) ->
      concurrentBuilds += baseConcurrentBuilds

      if      concurrentBuilds <= 1 then  49
      else if concurrentBuilds <= 3 then 149
)()

`function CodeshipMetadata() { return ContinuousIntegration.Codeship.getMetadata(); }`
`function CodeshipCostsForProjects(baseConcurrentBuilds, concurrentBuildsPerProject) { return ContinuousIntegration.Codeship.getCostsForProjects(baseConcurrentBuilds, concurrentBuildsPerProject); }`

ContinuousIntegration.MagnumCI = (->
  metadata =
    category: 'Continuous Integration'
    service:  'Magnum CI'
    unit:     'N/A'
    url:      'https://magnum-ci.com/pricing'
    updated:  '2014-10-19'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseUnits, unitsPerProject) ->
    Base.getCostsForProjects unitsPerProject, (units) ->
      0
)()

`function MagnumCIMetadata() { return ContinuousIntegration.MagnumCI.getMetadata(); }`
`function MagnumCICostsForProjects(baseUnits, unitsPerProject) { return ContinuousIntegration.MagnumCI.getCostsForProjects(baseUnits, unitsPerProject); }`

ContinuousIntegration.Semaphore = (->
  metadata =
    category: 'Continuous Integration'
    service:  'Semaphore'
    unit:     'Processor'
    url:      'https://semaphoreapp.com/pricing'
    updated:  '2014-10-20'

  getMetadata: (type) ->
    Base.getMetadata metadata, type

  getCostsForProjects: (type, baseProcessors, processorsPerProject) ->
    Base.getCostsForProjects processorsPerProject, (processors) ->
      processors += baseProcessors

      switch type
        when 'Organization'
          if      processors <= 2 then  99
          else if processors <= 4 then 199
        when 'Personal'
          if      processors <= 1 then 29
          else if processors <= 2 then 79
)()

`function SemaphoreMetadata(type) { return ContinuousIntegration.Semaphore.getMetadata(type); }`
`function SemaphoreCostsForProjects(type, baseProcessors, processorsPerProject) { return ContinuousIntegration.Semaphore.getCostsForProjects(type, baseProcessors, processorsPerProject); }`

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
