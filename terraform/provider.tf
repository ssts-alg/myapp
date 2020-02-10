resource "aws_vpc" "myvpc" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "Kannan"
  }

}
