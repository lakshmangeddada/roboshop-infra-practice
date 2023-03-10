variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.micro"
    }
    payment = {
      name = "payment"
      type = "t3.micro"
      password = "roboshop123"
    }
    redis = {
      name = "redis"
      type = "t3.micro"
    }
    frontend = {
      name = "frontend"
      type = "t3.micro"
    }
    user = {
      name = "user"
      type = "t3.micro"
    }
    mongodb = {
      name = "mongodb"
      type = "t3.micro"
    }
    rabbitmq = {
      name = "rabbitmq"
      type = "t3.micro"
      password = "roboshop123"
    }
    shipping = {
      name = "shipping"
      type = "t3.micro"
      password = "Roboshop@1"
    }
    mysql = {
      name = "mysql"
      type = "t3.micro"
      password = "Roboshop@1"
    }
    cart = {
      name = "cart"
      type = "t3.micro"
    }
  }
}