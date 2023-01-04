$worker  = 2
$timeout = 30
$app_dir = "/myproject"
$listen  = File.expand_path 'tmp/sockets/unicorn.sock', $app_dir
$pid     = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
$stdout_log = File.expand_path 'log/unicorn.stdout.log', $app_dir
$stderr_log = File.expand_path 'log/unicorn.stderr.log', $app_dir

worker_processes $worker
working_directory $app_dir
unless ENV.fetch("RAILS_ENV", "development") == "development"
  stdout_path $stdout_log
end
stderr_path $stderr_log
timeout $timeout
listen $listen
pid $pid
