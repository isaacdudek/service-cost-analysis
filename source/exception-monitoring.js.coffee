(exports ? this).ExceptionMonitoring ?= {}

ExceptionMonitoring.Airbrake = (->
  metadata =
    category: 'Exception Monitoring'
    service:  'Airbrake'
    unit:     'Project'
    url:      'https://airbrake.io/account/new'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseProjects, projectsPerProject) ->
    Base.getCostsForProjects projectsPerProject, (projects) ->
      projects += baseProjects

      if      projects <=  5 then  39
      else if projects <= 15 then  89
      else if projects <= 40 then 199
)()

`function AirbrakeMetadata() { return ExceptionMonitoring.Airbrake.getMetadata(); }`
`function AirbrakeCostsForProjects(baseProjects, projectsPerProject) { return ExceptionMonitoring.Airbrake.getCostsForProjects(baseProjects, projectsPerProject); }`

ExceptionMonitoring.Bugsnag = (->
  metadata =
    category: 'Exception Monitoring'
    service:  'Bugsnag'
    unit:     'Project'
    url:      'https://bugsnag.com/pricing'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseProjects, projectsPerProject) ->
    Base.getCostsForProjects projectsPerProject, (projects) ->
      projects += baseProjects

      if      projects <= 1 then  0
      else if projects <= 5 then 29
      else if projects >  5 then 99
)()

`function BugsnagMetadata() { return ExceptionMonitoring.Bugsnag.getMetadata(); }`
`function BugsnagCostsForProjects(baseProjects, projectsPerProject) { return ExceptionMonitoring.Bugsnag.getCostsForProjects(baseProjects, projectsPerProject); }`

ExceptionMonitoring.Honeybadger = (->
  metadata =
    category: 'Exception Monitoring'
    service:  'Honeybadger'
    unit:     'Application'
    url:      'https://www.honeybadger.io/pages/plans'
    updated:  '2014-10-15'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseApplications, applicationsPerProject) ->
    Base.getCostsForProjects applicationsPerProject, (applications) ->
      applications += baseApplications

      if      applications <=  2 then  29
      else if applications <=  5 then  49
      else if applications <= 10 then  89
      else if applications <= 50 then 249
)()

`function HoneybadgerMetadata() { return ExceptionMonitoring.Honeybadger.getMetadata(); }`
`function HoneybadgerCostsForProjects(baseApplications, applicationsPerProject) { return ExceptionMonitoring.Honeybadger.getCostsForProjects(baseApplications, applicationsPerProject); }`

ExceptionMonitoring.Raygun = (->
  metadata =
    category: 'Exception Monitoring'
    service:  'Raygun'
    unit:     'Application'
    url:      'https://raygun.io/pricing'
    updated:  '2014-10-18'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseApplications, applicationsPerProject) ->
    Base.getCostsForProjects applicationsPerProject, (applications) ->
      applications += baseApplications

      if      applications <=  1 then  29
      if      applications <=  5 then  49
      else if applications <= 20 then 149
      else if applications <= 50 then 499
)()

`function RaygunMetadata() { return ExceptionMonitoring.Raygun.getMetadata(); }`
`function RaygunCostsForProjects(baseApplications, applicationsPerProject) { return ExceptionMonitoring.Raygun.getCostsForProjects(baseApplications, applicationsPerProject); }`

ExceptionMonitoring.Rollbar = (->
  metadata =
    category: 'Exception Monitoring'
    service:  'Rollbar'
    unit:     'Included Occurrences / Day'
    url:      'https://rollbar.com/pricing/'
    updated:  '2014-10-16'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseIncludedOccurrencesPerDay, includedOccurrencesPerDayPerProject) ->
    Base.getCostsForProjects includedOccurrencesPerDayPerProject, (includedOccurrencesPerDay) ->
      includedOccurrencesPerDay += baseIncludedOccurrencesPerDay

      if      includedOccurrencesPerDay <=     3000 / 30 then    0
      else if includedOccurrencesPerDay <=    40000 / 30 then   12
      else if includedOccurrencesPerDay <=   200000 / 30 then   49
      else if includedOccurrencesPerDay <=   750000 / 30 then  149
      else if includedOccurrencesPerDay <=  3500000 / 30 then  499
      else if includedOccurrencesPerDay <= 10000000 / 30 then 1249
)()

`function RollbarMetadata() { return ExceptionMonitoring.Rollbar.getMetadata(); }`
`function RollbarCostsForProjects(baseIncludedOccurrencesPerDay, includedOccurrencesPerDayPerProject) { return ExceptionMonitoring.Rollbar.getCostsForProjects(baseIncludedOccurrencesPerDay, includedOccurrencesPerDayPerProject); }`

ExceptionMonitoring.Sentry = (->
  metadata =
    category: 'Exception Monitoring'
    service:  'Sentry'
    unit:     'Events / Day'
    url:      'https://www.getsentry.com/pricing/'
    updated:  '2014-10-16'

  getMetadata: ->
    Base.getMetadata metadata

  getCostsForProjects: (baseEventsPerDay, eventsPerDayPerProject) ->
    Base.getCostsForProjects eventsPerDayPerProject, (eventsPerDay) ->
      eventsPerDay += baseEventsPerDay

      if      eventsPerDay <= 250           then   0
      else if eventsPerDay <=  10 * 60 * 24 then   9
      else if eventsPerDay <=  25 * 60 * 24 then  24
      else if eventsPerDay <=  50 * 60 * 24 then  79
      else if eventsPerDay <= 200 * 60 * 24 then 199
)()

`function SentryMetadata() { return ExceptionMonitoring.Sentry.getMetadata(); }`
`function SentryCostsForProjects(baseEventsPerDay, eventsPerDayPerProject) { return ExceptionMonitoring.Sentry.getCostsForProjects(baseEventsPerDay, eventsPerDayPerProject); }`
