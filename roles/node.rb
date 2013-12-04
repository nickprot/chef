name "node"
run_list "recipe[webserver]"
default_attributes "apache" =>
{"default_site_enabled" => true }