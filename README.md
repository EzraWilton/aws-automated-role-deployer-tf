<h1> AWS Role Deployer (Terraform) </h1>
<h3> Deploy roles to an AWS Account</h3>
<p>Each role configuration goes in a folder under /roles . Terraform reads all folders and will build a role for each one. It looks for a configuration file for inputs and supports one custom policy which is attached as an inline policy, or it can be left out entirely. Supports AWS Managed Policies provided by name. Config variables are used to populate the attached policies and trust policy inputs for assume role conditions/control. For use with single account for all roles</p>
<p>Indented for use by account administrators to provide access to sso federated users with view-only or basic roles. </p>
<br>
<strong> Does not support multiple inline policies </strong>
<br>

To Deploy a new role:

Clone this repo
Copy one of the folders under roles, name the folder with your name+change number "YourName-CHG1000"
Fill out the configuration file:
- Name of the Role to deploy. This should be your name_change-number
- Start/End Times and Dates are for how long the role will last
- AccountID: of role target is required
- UserList: is list of users. Min 1
- ManagedPolicies: is a list of names of AWS Managed Policies. Terraform will figure out the Arn for you
- PolicyPath is the filepath to your inline policy. Must be str in list format but only supports one path to one inline policy. If not required, provide empty list [ ]
Submit an new MR with your folder, request approval.
Once merged, review the plan in terraform enterprise to verify it is deploying your role only
