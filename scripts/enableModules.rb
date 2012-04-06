# Enables the modules code_review and commit_relation_editor
# in all projects
# Run with script/runner -e production enableModules.rb

failedProjects = []
modules_to_enable = ['code_review', 'commit_relation_editor']

Project.find(:all).each do |project|
  print "Enabling modules for project '#{project.identifier}' ... "
  enabled_module_names = project.enabled_module_names

  modules_to_enable.each do |mod|
    if !enabled_module_names.include?(mod)
      enabled_module_names.push(mod)
      # can do other stuff for module mod heres
    end
  end

  project.enabled_module_names = enabled_module_names
  if project.save
    puts "done"
  else
    failedProjects.push(project)
    puts "failed"
  end
end

if failedProjects.empty?
  puts "Successful on all projects"
else
  puts "Failed on the follwing projects"
  failedProjects.each {|p| puts p.identifier}
end
