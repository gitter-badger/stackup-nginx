require 'mixlib/shellout'
require 'serverspec'

set :backend, :exec
set :path, '$PATH:/sbin:/usr/local/sbin'

describe package('nginx-extras') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_running }
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should_not be_listening }
end

host_ip = Mixlib::ShellOut.new(
  "ifconfig | grep cast | cut -d ':' -f 2 | cut -d ' ' -f 1"
).run_command.stdout.strip

describe host(host_ip) do
  it { should be_reachable.with(port: 80) }
end
