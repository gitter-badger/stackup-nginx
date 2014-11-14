include_recipe 'stackup-base'

package 'nginx-extras'

service 'nginx' do
  provider Chef::Provider::Service::Upstart
end

node['nginx']['http_ports'].each do |http_port|
  firewall_rule "http for #{http_port}" do
    port http_port
    action :allow
  end
end

node['nginx']['https_ports'].each do |https_port|
  firewall_rule "https for #{https_port}" do
    port https_port
    action :allow
  end
end
