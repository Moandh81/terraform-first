resource "aws_vpc" "vpc-example-1" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      Name  = "Terraform-aws-vpc-example"
    }
}

resource "aws_subnet" "subnet1" {

    cidr_block= "${cidrsubnet(aws_vpc.vpc-example-1.cidr_block, 3, 1)}"
    vpc_id = "${aws_vpc.vpc-example-1.id}"
    availability_zone = "eu-west-3a"
}



resource "aws_subnet" "subnet2" {

    cidr_block= "${cidrsubnet(aws_vpc.vpc-example-1.cidr_block, 2, 2)}"
    vpc_id = "${aws_vpc.vpc-example-1.id}"
    availability_zone = "eu-west-3a"
}


resource "aws_security_group" "subnet-security" {
    vpc_id = "${aws_vpc.vpc-example-1.id}"
    ingress  {

        cidr_blocks = [

            "${aws_vpc.vpc-example-1.cidr_block}"

        ]

        from_port = 80
        to_port = 80
        protocol = "tcp"


    } 

}
