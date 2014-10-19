(exports ? this).PerformanceMonitoring ?= {}

PerformanceMonitoring.Skylight = (->
  metadata =
    category: 'Performance Monitoring'
    service:  'Skylight'
    unit:     'Request'
    url:      'https://www.skylight.io/#pricing'
    updated:  '2014-10-19'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseRequests, requestsPerProject) ->
    Base.getCostsForProjects requestsPerProject, (requests) ->
      requests += baseRequests

      if      requests <=    100000 then   0
      else if requests <=   1000000 then  20
      else if requests <=   5000000 then 100
      else if requests <=  20000000 then 250
      else if requests <=  50000000 then 370
      else if requests <= 100000000 then 470
)()

`function SkylightMetadata() { return PerformanceMonitoring.Skylight.getMetadata(); }`
`function SkylightCostsForProjects(baseRequests, requestsPerProject) { return PerformanceMonitoring.Skylight.getCostsForProjects(baseRequests, requestsPerProject); }`
