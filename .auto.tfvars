# Enable the flag below if you want to create a EC2 capacity provider
# for your ECS cluster.  If the flag is disabled a Fargate capacity provider
# will be used.
ec2Enable = true

# Enable the flag below to create a database instance.
# The instance will be created with no schemas besides the master
databaseEnable = true

# If creating a database instance select the engine to be used.
# Valid values are: postgres, mysql
databaseEngine = "postgres"

# Master User to be created in the new database.
# (The password will be saved under a AWS Secret Manager key)
databaseMasterUser = "master"
