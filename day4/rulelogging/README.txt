# Observe normal rule logging
load_random_user
perform_login
get_request_id

# Copy in rule logging configuration from the lab copy of bharosa_server.properties

# Uncomment the following lines and then update the deployment
vcrypt.tracker.rules.trace.policySet.postauth=false

# Update the deployment and observe post authentication rule logging in a disabled state
load_random_user
perform_login
get_request_id

# Uncomment the following lines and then update the deployment
vcrypt.tracker.rules.trace.policySet.preauth=false

# Update the deployment and observe pre authentication rule logging in a disabled state
load_random_user
perform_login
get_request_id

# Uncomment the following lines and then update the deployment
vcrypt.tracker.rules.trace.policySet.deviceid=false

# Update the deployment and observe device identification rule logging in a disabled state
load_random_user
perform_login
get_request_id

# Re-enable all policySet logging and update the deployment

# Observe rule logging being restored
load_random_user
perform_login
get_request_id

# Uncomment the following lines and then update the depolyment
vcrypt.tracker.rules.trace.notTriggered.logMillis=1

# Observe that even non-triggered rules get logged by running the following commands
load_random_user
perform_login
get_request_id