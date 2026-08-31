# Security Group for the web server (public-facing)
resource "aws_security_group" "web_server" {
  name        = "ecommerce-web-server-sg"
  description = "Allow HTTP/HTTPS traffic from the internet"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP from anywhere (redirect to HTTPS in production)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecommerce-web-server-sg"
  }
}

# Security Group for the database (private, restricted access)
resource "aws_security_group" "database" {
  name        = "ecommerce-database-sg"
  description = "Allow database traffic only from the web server"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow PostgreSQL traffic only from web server security group"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web_server.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecommerce-database-sg"
  }
}
