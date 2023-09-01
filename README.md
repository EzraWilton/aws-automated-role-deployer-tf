<h1> AWS Role Deployer (Terraform) </h1>
<h3> Deploy roles to an AWS Account</h3>
<p>Each role configuration goes in a folder under /roles . Terraform reads all folders and will build a role for each one. It looks for a configuration file for inputs and supports one custom policy which is attached as an inline policy, or it can be left out entirely. Supports AWS Managed Policies provided by name. Config variables are used to populate the attached policies and trust policy inputs for assume role conditions/control. For use with single account for all roles</p>
<p>Indented for use by account administrators to provide access to sso federated users with view-only or basic roles. </p>
<br>
<strong> Does not support multiple inline policies </strong>
<br>
<p>To Deploy a new role:</p>
<li>Clone this repo</li>
<li>Copy one of the folders under roles, name the folder somthing suitable </li>
<li>Fill out the configuration file. Set your start/end time and dates and the path of your inline policy if required. Provide empty list if not required</li>
<li>Replace the inline-policy if you need one, otherwise remove the copied one</li>
<li>Submit an new MR with your folder, request approval.</li>
<li>Once merged, review the plan in terraform enterprise to verify it is deploying your role only </li>

