# Install custom jar
#

unless "#{node.elasticsearch[:custom_jars]}".empty?
    "#{node.elasticsearch[:custom_jars]}".each do |custom_jar|
        execute "Get custom Jar" do
            command "curl -L -o #{node.elasticsearch[:dir]}/elasticsearch/lib/#{custom_jar['name']} -u #{custom_jar['url_credential_user']}:#{custom_jar['url_credential_pwd']} #{custom_jar['url']}"
	        user node.elasticsearch[:user]
	        group node.elasticsearch[:user]
	        not_if (custom_jar['name']==nil) 
	        notifies :restart, resources(:service => 'elasticsearch')	
        end
    end
end