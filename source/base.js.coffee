(exports ? this).Base ?= {}

Base.getCostsForProjects = (unitsPerProject, getCostForProjects) ->
  costsForProjects = for numberOfProjects in [0..20]
    costForProjects = getCostForProjects(numberOfProjects * unitsPerProject)
    costForProjects = 0 unless costForProjects? and costForProjects > 0
    costForProjects

  [costsForProjects]

Base.getLabels = (unitsPerProject) ->
  Base.getCostsForProjects unitsPerProject, (units) ->
    units

`function Labels(unitsPerProject) { return Base.getLabels(unitsPerProject); }`

Base.getMetadata = (metadata, type) ->
  category = metadata.category
  service = metadata.service
  unit = metadata.unit

  service += " (#{type})" if type?

  [[category, service, unit]]
