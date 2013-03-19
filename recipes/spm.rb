# Install SPM
#

package 'collectd' do
  action :install
end

bash "increase limits for the spmsender user" do
  user 'root'
  
  code <<-END.gsub(/^    /, '')
    echo 'spmsender     -    nofile   32000'  >> /etc/security/limits.conf
  END
  
  not_if do
    file = ::File.read("/etc/security/limits.conf")
    file.include?("spmsender     -    nofile   32000")
  end
end

execute "Install SPM for #{node.elasticsearch[:spm][:key]}" do
  command "curl -ko installer.sh \"https://apps.sematext.com/spm-reports/installerDownload.do?client_token=#{node.elasticsearch[:spm][:key]}\" && sudo bash installer.sh"
  not_if (node.elasticsearch[:spm]==nil)
end