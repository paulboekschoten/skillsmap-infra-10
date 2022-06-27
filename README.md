# skillsmap-infra-10
Skillsmap cloud/infra tab, exercise line 10

# Task
on AWS.  
create VPC.  
create 2 subnets, one for public network, one for private network.  
create internet gw and connect to public network.  
create nat gateway, and connect to private network.  
create Auto scaling group for app, ec2 only private subnet.  
create a LB on https (check Application Load Balancer or Network Load Balancer).  
publish a service over LB, ie nginx.  

# Usage
Git clone
```
git clone https://github.com/paulboekschoten/skillsmap-infra-10.git
```

Change directory
```
cd skillsmap-infra-10
```
 
 

# TODO
- [ ] Create Launch Configuration
- [ ] Create Autoscaling Group
- [ ] Create Load Balancer
- [ ] Create HTTPS Certificate
- [ ] Create Listener

# DONE
- [x] Create VPC
- [x] Create Subnets
- [x] Create Internet Gateway
- [x] Create NAT gateway
- [x] Create Security Groups
- [x] Create Route Tables
- [x] Create Security Group Rules
- [x] Create Target Group