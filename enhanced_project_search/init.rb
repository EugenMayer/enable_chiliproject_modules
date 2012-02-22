require 'redmine'

require_dependency 'enhanced_project_search/hooks'

Redmine::Plugin.register :enhanced_project_search do
  name 'Enhanced project search plugin'
  author 'Florian Pommerening'
  description 'Shows a project search in a chosen-select field'
  version '0.0.1'
  url 'https://bugtracking.kontextwork.de/issues/597'
end