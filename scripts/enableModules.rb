# Enables the modules code_review and commit_relation_editor
# in all projects
# Run with script/runner -e production enableModules.rb

failedProjects = []

Project.find(:all).each do |project|
  print "Enabling modules for project '#{project.identifier}' ... "
  enabled_module_names = project.enabled_module_names

  if !enabled_module_names.include?("code_review")
    enabled_module_names.push("code_review")
  end
  if !enabled_module_names.include?("commit_relation_editor")
    enabled_module_names.push("commit_relation_editor")
  end

  project.enabled_module_names = enabled_module_names
  if !project.save
    failedProjects.push(project)
    puts "failed"
  end
  puts "done"
end

if !failedProjects.empty?
  puts "Failed on the follwing projects"
  failedProjects.each {|p| puts p.identifier}
end
