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
