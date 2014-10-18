(exports ? this).CodeReview ?= {}

CodeReview.Codebrag = (->
  metadata =
    category: 'Code Review'
    service:  'Codebrag'
    unit:     'User'
    url:      'http://codebrag.com/pricing.html'
    updated:  '2014-10-17'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseUsers, usersPerProject) ->
    Base.getCostsForProjects usersPerProject, (users) ->
      users += baseUsers

      users * 3
)()

`function CodebragMetadata() { return CodeReview.Codebrag.getMetadata(); }`
`function CodebragCostsForProjects(baseUsers, usersPerProject) { return CodeReview.Codebrag.getCostsForProjects(baseUsers, usersPerProject); }`

CodeReview.CodeClimate = (->
  metadata =
    category: 'Code Review'
    service:  'Code Climate'
    unit:     'Git Repository'
    url:      'https://codeclimate.com/pricing'
    updated:  '2014-10-17'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseGitRepositories, gitRepositoriesPerProject) ->
    Base.getCostsForProjects gitRepositoriesPerProject, (gitRepositories) ->
      gitRepositories += baseGitRepositories

      if      gitRepositories <=  5 then  99
      else if gitRepositories <= 10 then 199
      else if gitRepositories <= 20 then 399
)()

`function CodeClimateMetadata() { return CodeReview.CodeClimate.getMetadata(); }`
`function CodeClimateCostsForProjects(baseGitRepositories, gitRepositoriesPerProject) { return CodeReview.CodeClimate.getCostsForProjects(baseGitRepositories, gitRepositoriesPerProject); }`

CodeReview.PullReview = (->
  metadata =
    category: 'Code Review'
    service:  'PullReview'
    unit:     'N/A'
    url:      'https://www.pullreview.com/site/plans'
    updated:  '2014-10-17'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseUnits, unitsPerProject) ->
    Base.getCostsForProjects unitsPerProject, (units) ->
      25.52
)()

`function PullReviewMetadata() { return CodeReview.PullReview.getMetadata(); }`
`function PullReviewCostsForProjects(baseUnits, unitsPerProject) { return CodeReview.PullReview.getCostsForProjects(baseUnits, unitsPerProject); }`
