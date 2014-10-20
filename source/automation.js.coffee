(exports ? this).Automation ?= {}

Automation.IFTTT = (->
  metadata =
    category: 'Automation'
    service:  'IFTTT'
    unit:     'N/A'
    url:      'https://ifttt.com/'
    updated:  '2014-10-19'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseUnits, unitsPerProject) ->
    Base.getCostsForProjects unitsPerProject, (units) ->
      0
)()

`function IFTTTMetadata() { return Automation.IFTTT.getMetadata(); }`
`function IFTTTCostsForProjects(baseUnits, unitsPerProject) { return Automation.IFTTT.getCostsForProjects(baseUnits, unitsPerProject); }`
