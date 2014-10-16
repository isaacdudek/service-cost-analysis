(exports ? this).UptimeMonitoring ?= {}

UptimeMonitoring.Pingdom = (->
  metadata =
    category: 'Uptime Monitoring'
    service:  'Pingdom'
    unit:     'Check'
    url:      'https://www.pingdom.com/pricing/'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseChecks, checksPerProject) ->
    Base.getCostsForProjects checksPerProject, (checks) ->
      checks += baseChecks

      if      checks <=   1 then   0.00
      else if checks <=  10 then  14.95
      else if checks <=  50 then  45.95
      else if checks <= 250 then 199.00
      else if checks <= 500 then 495.00
)()

`function PingdomMetadata() { return UptimeMonitoring.Pingdom.getMetadata(); }`
`function PingdomCostsForProjects(baseChecks, checksPerProject) { return UptimeMonitoring.Pingdom.getCostsForProjects(baseChecks, checksPerProject); }`
