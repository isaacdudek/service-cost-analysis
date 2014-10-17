(exports ? this).CodeReview ?= {}

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
