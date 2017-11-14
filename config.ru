# --- Start of unicorn worker killer code ---

if ENV['RAILS_ENV'] == 'production' || ENV['RAILS_ENV'] == 'staging'
  require 'unicorn/worker_killer'

  max_request_min =  3072
  max_request_max =  4096

  # Max requests per worker
  use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max

  oom_min = (192) * (1024**2)
  oom_max = (256) * (1024**2)

  # Max memory size (RSS) per worker
  use Unicorn::WorkerKiller::Oom, oom_min, oom_max
end

# --- End of unicorn worker killer code ---

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
