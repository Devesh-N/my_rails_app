Datadog.configure do |c|
  c.env = 'dev'
  c.service = 'ruby-app'
  c.tracing.sampling.default_rate = 1.0
  c.profiling.enabled = true
  c.appsec.enabled = true
end