resource "aws_security_group" "example" {
  name   = "sg"
  vpc_id = aws_vpc.example.id

  ingress = [
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  ]
  egress  = [
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
  ]
}
