**07-12-2023**

**How to write conditional statements in Terraform Code?**

In Terraform Code we can use conditional statements to control the creation or configuration of resources based on the conditions which we required. Commonly we use “ ?, : “ these to write a conditional statement. For better understanding please see the below code :

    variable "environment" {
      default = "development"
    }

    resource "aws_instance" "example" {
      ami           = "ami-0c55b159cbfafe1f0"
      instance_type = "t2.micro"

    **// Use a conditional statement to set the key_name based on the environment
    key_name = var.environment == "production" ? "production-key" : "development-key"**
    }
In the above example what we are trying to say is here the key_name attribute of the aws_instance resource is set conditionally. If the value of the environment variable is "production," the key_name is set to "production-key"; otherwise, it is set to "development-key."

**What is meant by Functions in Terraform Code and How to use a functions in Terraform Code?**

In Terraform, functions are built-in operations that allow you to manipulate data, perform calculations, and achieve various other tasks within your configuration. These functions can be used to transform values, manipulate strings, perform arithmetic operations, and more. Terraform provides a set of standard functions that you can leverage in your configuration files. There are so many types of functions in terraform for depth understanding we can go through this below link:

https://www.terraform.io/docs/language/functions/index.html

For Better Understanding please see some examples below :

    variable "name" {
      default = "terraform"
    }

    # Using the upper function to convert the value of the 'name' variable to uppercase
    output "uppercase_name" {
      value = upper(var.name)
    }

    # Using the length function to determine the length of a string
    output "name_length" {
      value = length(var.name)
    }

    # Using the format function to create a formatted string
    output "formatted_string" {
      value = format("Hello, %s!", var.name)
    }

    # Using the list function to create a list
    output "example_list" {
      value = list("item1", "item2", "item3")
    }

    # Using the concat function to concatenate lists
    output "concatenated_list" {
      value = concat(list("item1", "item2"), list("item3", "item4"))
    }

    # Using the lookup function to retrieve a value from a map
    variable "example_map" {
      default = {
       key1 = "value1"
       key2 = "value2"
     }
    }

    output "map_value" {
      value = lookup(var.example_map, "key1", "default_value")
    }
**What is meant by Resource Dependency in Terraform Code and How to use a resource dependency in Terraform Code?**

Resource dependency is usually used to create relationship between two different resources and also to define the order on how they should be created.

There are 2 types of resource dependency they are :

•	Implicit Dependency

•	Explicit Dependency

**Implicit Dependency** is done automatically by terraform.

**Explicit Dependency** is done by the meta arguments which we given.

For better understanding we can learn this by a simple example like if we are creating aws instance and aws security group separately but we need to attach that newly creating security group to the newly creating instance or already created instance then we will write the code like below :

    # Creating a security group
    resource "aws_security_group" "my_security_group" {
      name        = "my-security-group"
      vpc_id = aws_vpc.my_vpc.id

    egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
     }
    }

    # Creating an EC2 instance
    resource "aws_instance" "my_instance" {
      ami           = "ami-0230bd60aa48260c6"
      instance_type = "t2.micro"
      subnet_id     = aws_subnet.my_subnet.id
      key_name      = "Test"  
      **vpc_security_group_ids = [aws_security_group.my_security_group.id]**
    }
Here in the above example we can see that we are attaching the above created security group to the EC2 Instance. By writing like this in the code we can create resource dependency.
