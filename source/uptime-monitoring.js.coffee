(exports ? this).UptimeMonitoring ?= {}

UptimeMonitoring.Panopta = (->
  metadata =
    category: 'Uptime Monitoring'
    service:  'Panopta'
    unit:     'Network Check'
    url:      'https://www.panopta.com/pricing/'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseNetworkChecks, networkChecksPerProject) ->
    Base.getCostsForProjects networkChecksPerProject, (networkChecks) ->
      networkChecks += baseNetworkChecks

      if      networkChecks <=   5 then   8
      else if networkChecks <=  10 then  19
      else if networkChecks <=  25 then  39
      else if networkChecks <=  50 then  99
      else if networkChecks <= 150 then 249
)()

`function PanoptaMetadata() { return UptimeMonitoring.Panopta.getMetadata(); }`
`function PanoptaCostsForProjects(baseNetworkChecks, networkChecksPerProject) { return UptimeMonitoring.Panopta.getCostsForProjects(baseNetworkChecks, networkChecksPerProject); }`

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
