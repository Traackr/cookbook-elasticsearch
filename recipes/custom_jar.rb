# Install custom jar
#

execute "Get custum Jar" do
  command "curl -L -o #{node.elasticsearch[:dir]}/elasticsearch/lib/#{node.elasticsearch[:custom_jar][:name]} -u #{node.elasticsearch[:custom_jar][:url_credential_user]}:#{node.elasticsearch[:custom_jar][:url_credential_pwd]} '#{node.elasticsearch[:custom_jar][:url]}'"
	user node.elasticsearch[:user]
	group node.elasticsearch[:user]
	not_if (node.elasticsearch[:custom_jar][:name]==nil) 
	notifies :restart, resources(:service => 'elasticsearch')	
end