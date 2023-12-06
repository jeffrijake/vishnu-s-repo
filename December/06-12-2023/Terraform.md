06-12-2023
How to write the HCL Syntax or what is the structure of HCL Syntax?
Note :- Wenever we want to comment the any line in the code we need to add "#" before that line then it is commented while running the code that line will not be considered as code. if we put "/*" then it will be multi line comment. we close that multi line commenting by "*/"
A syntax contains Blocks. It means A block is a container for other content for example:
**resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}**
Every Block starts with block type we can see it in below example the bold one is the one type of block. There are many other block types like provider block, resource block, data block, variable block, output block, etc,…
**resource** "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}
Based on the block type it will expects some labels, in this resource block it is expecting 2 labels which we can understand by seeing the below code :
resource **"aws_vpc" "my_vpc"** {
  cidr_block = "10.0.0.0/16"
}
After giving the Block Type and Labels then we will move further with the Block Body. It will start and end with this characters {} we can see that in the below example :
resource "aws_vpc" "my_vpc" **{
  cidr_block = "10.0.0.0/16"
}**
In the block body we will mention the attributes and values like shown below left side of “=” is attributes and right side of “=” is values :
Note -  we can add no of attributes and values and sub blocks also based on our requirements.
resource "aws_instance" "my_instance" {
  **ami           = "ami-0230bd60aa48260c6"
  count = 2
  enabled = true**
}
If we observe carefully in the Block Body there are values mentioned in different ways so those are called Data Types. There are different type of data types they are :
•	**Strings
•	Number
•	Boolean
•	List
•	Maps**

**Strings** : If we mention any value in the invited comas i.e like this **“ ”** then those are called strings.
**Number** : If we mention any value in just numerical mode then it is called number.
**Boolean** : If we mention any value in just by saying **True or False** then it is called Boolean.
We can see below example for understanding above data types accordingly:
resource "aws_instance" "my_instance" {
  ami           = **"ami-0230bd60aa48260c6"**
  security_groups = **“sg-1”**
  count = **2**
  enabled = **true**
}
**List** : It means if we want to add multiple values to the one attribute then we will do it by adding **“[]”** in starting and ending of that value and in that square brackets we will separate the values by using **coma(,)** for better understanding we can see the below example :
resource "aws_instance" "my_instance" {
  ami           = "ami-0230bd60aa48260c6"
  security_groups = **[“sg-1”, “sg-2”, “sg-3”]**
  count = 2
  enabled = true
}





**Maps** : It means data structure that stores key-value pairs. HCL uses maps to represent complex data structures, where each key is associated with a specific value. A map is defined using curly braces {} and key-value pairs separated by colons. For better understanding we can see the below example :
variable "example_map" {
  type = map(string)
  default = **{
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }**
}.


