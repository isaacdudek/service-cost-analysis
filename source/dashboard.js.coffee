(exports ? this).Dashboard ?= {}

Dashboard.Geckoboard = (->
  metadata =
    category: 'Dashboard'
    service:  'Geckoboard'
    unit:     'Dashboard'
    url:      'https://www.geckoboard.com/pricing/'
    updated:  '2014-10-14'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseDashboards, dashboardsPerProject) ->
    Base.getCostsForProjects dashboardsPerProject, (dashboards) ->
      dashboards += baseDashboards

      if      dashboards <= 1 then 19
      else if dashboards >  1 then 59
)()

`function GeckoboardMetadata() { return Dashboard.Geckoboard.getMetadata(); }`
`function GeckoboardCostsForProjects(baseDashboards, dashboardsPerProject) { return Dashboard.Geckoboard.getCostsForProjects(baseDashboards, dashboardsPerProject); }`
