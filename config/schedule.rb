# set :output, "/path/to/my/cron_log.log"

# every :day do
#   runner "AnotherModel.prune_old_records"
# end

every 1.day, :at => '7:00 pm' do
  runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
end