namespace :test_task do
  p "TASK GENERATED BY RAILS GENERATOR"

  task :only_run_when_told do
    puts "TRAVIS ONLY RUNS THIS TASK WHEN TOLD"
  end
end
