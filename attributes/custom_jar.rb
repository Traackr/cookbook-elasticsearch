# Load configuration and credentials from data bag 'elasticsearch/custom_jar' -
#
aws = Chef::DataBagItem.load('elasticsearch', 'custom_jar') rescue {}
# ----------------------------------------------------------------------

# === CUSTOM JAR ===
#
default.elasticsearch[:custom_jar][:name] = "none";
default.elasticsearch[:custom_jar][:url] = "none";
default.elasticsearch[:custom_jar][:url_credential_user] = nil;
default.elasticsearch[:custom_jar][:url_credential_pwd] = nil;