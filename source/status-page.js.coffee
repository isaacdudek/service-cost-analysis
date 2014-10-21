(exports ? this).StatusPage ?= {}

StatusPage.StatusHub = (->
  metadata =
    category: 'Status Page'
    service:  'StatusHub'
    unit:     'N/A'
    url:      'https://statushub.io/pricing'
    updated:  '2014-10-16'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseUnits, unitsPerProject) ->
    Base.getCostsForProjects unitsPerProject, (units) ->
      49
)()

`function StatusHubMetadata() { return StatusPage.StatusHub.getMetadata(); }`
`function StatusHubCostsForProjects(baseUnits, unitsPerProject) { return StatusPage.StatusHub.getCostsForProjects(baseUnits, unitsPerProject); }`

StatusPage.StatusIO = (->
  metadata =
    category: 'Status Page'
    service:  'Status.io'
    unit:     'Subscriber'
    url:      'https://status.io/pricing'
    updated:  '2014-10-16'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseSubscribers, subscribersPerProject) ->
    Base.getCostsForProjects subscribersPerProject, (subscribers) ->
      subscribers += baseSubscribers

      if      subscribers <=   500 then  36
      else if subscribers <=  2500 then  59
      else if subscribers <= 15000 then 199
)()

`function StatusIOMetadata() { return StatusPage.StatusIO.getMetadata(); }`
`function StatusIOCostsForProjects(baseSubscribers, subscribersPerProject) { return StatusPage.StatusIO.getCostsForProjects(baseSubscribers, subscribersPerProject); }`

StatusPage.StatusPageIO = (->
  metadata =
    category: 'Status Page'
    service:  'StatusPage.io'
    unit:     'Subscriber'
    url:      'https://www.statuspage.io/pricing'
    updated:  '2014-10-16'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseSubscribers, subscribersPerProject) ->
    Base.getCostsForProjects subscribersPerProject, (subscribers) ->
      subscribers += baseSubscribers

      if      subscribers <=  250 then  29
      else if subscribers <= 1000 then  99
      else if subscribers <= 5000 then 399
)()

`function StatusPageIOMetadata() { return StatusPage.StatusPageIO.getMetadata(); }`
`function StatusPageIOCostsForProjects(baseSubscribers, subscribersPerProject) { return StatusPage.StatusPageIO.getCostsForProjects(baseSubscribers, subscribersPerProject); }`
