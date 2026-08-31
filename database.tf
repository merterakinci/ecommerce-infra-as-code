# Groups the private subnets together so RDS knows where it's allowed to live
resource "aws_db_subnet_group" "main" {
  name       = "ecommerce-db-subnet-group"
  subnet_ids = [aws_subnet.private.id, aws_subnet.private_2.id]

  tags = {
    Name = "ecommerce-db-subnet-group"
  }
}

# The actual PostgreSQL database instance
resource "aws_db_instance" "ecommerce_db" {
  identifier             = "ecommerce-db"
  engine                 = "postgres"
  engine_version         = "16.15"
  instance_class         = "db.t3.micro"       # Free Tier eligible
  allocated_storage      = 20                   # GB - Free Tier covers up to 20GB
  storage_type           = "gp2"

  db_name                = "ecommerce"
  username               = var.db_username
  password               = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.database.id]

  publicly_accessible    = false                # Critical: never expose the database to the internet
  skip_final_snapshot    = true                 # OK for learning; in production you'd want a final snapshot
  multi_az               = false                # Free Tier doesn't cover Multi-AZ

  tags = {
    Name = "ecommerce-db"
  }
}
