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

Automation.Zapier = (->
  metadata =
    category: 'Automation'
    service:  'Zapier'
    unit:     'Task'
    url:      'https://zapier.com/app/pricing'
    updated:  '2014-10-19'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseTasks, tasksPerProject) ->
    Base.getCostsForProjects tasksPerProject, (tasks) ->
      tasks += baseTasks

      if      tasks <=   100 then   0
      else if tasks <=  3000 then  20
      else if tasks <= 15000 then  50
      else if tasks <= 20000 then  75
      else if tasks <= 50000 then 125
)()

`function ZapierMetadata() { return Automation.Zapier.getMetadata(); }`
`function ZapierCostsForProjects(baseTasks, tasksPerProject) { return Automation.Zapier.getCostsForProjects(baseTasks, tasksPerProject); }`
