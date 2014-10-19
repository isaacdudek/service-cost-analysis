(exports ? this).RepositoryHosting ?= {}

RepositoryHosting.Bitbucket = (->
  metadata =
    category: 'Repository Hosting'
    service:  'Bitbucket'
    unit:     'User'
    url:      'https://bitbucket.org/plans'
    updated:  '2014-10-18'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseUsers, usersPerProject) ->
    Base.getCostsForProjects usersPerProject, (users) ->
      users += baseUsers

      if      users <=   5 then   0
      else if users <=  10 then  10
      else if users <=  25 then  25
      else if users <=  50 then  50
      else if users <= 100 then 100
      else if users >  100 then 200
)()

`function BitbucketMetadata() { return RepositoryHosting.Bitbucket.getMetadata(); }`
`function BitbucketCostsForProjects(baseUsers, usersPerProject) { return RepositoryHosting.Bitbucket.getCostsForProjects(baseUsers, usersPerProject); }`

RepositoryHosting.Codebase = (->
  metadata =
    category: 'Repository Hosting'
    service:  'Codebase'
    unit:     'Active Project'
    url:      'https://www.codebasehq.com/packages'
    updated:  '2014-10-19'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseActiveProjects, activeProjectsPerProject) ->
    Base.getCostsForProjects activeProjectsPerProject, (activeProjects) ->
      activeProjects += baseActiveProjects

      if      activeProjects <=   1 then   0.00
      else if activeProjects <=   3 then   8.08
      else if activeProjects <=  15 then  21.00
      else if activeProjects <=  30 then  33.92
      else if activeProjects <=  60 then  64.60
      else if activeProjects <= 140 then 153.43
)()

`function CodebaseMetadata() { return RepositoryHosting.Codebase.getMetadata(); }`
`function CodebaseCostsForProjects(baseActiveProjects, activeProjectsPerProject) { return RepositoryHosting.Codebase.getCostsForProjects(baseActiveProjects, activeProjectsPerProject); }`
