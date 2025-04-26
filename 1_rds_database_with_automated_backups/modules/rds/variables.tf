########################
# General information
########################

variable "project_name" {
  type        = string
  description = "The project name. Used to name the RDS instance and add relevant tags."
}

########################
# DB configuration
########################

# DB free tier https://aws.amazon.com/rds/free/
variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "The instance class used to create the RDS instance. Requires a free-tier instance class."

  validation {
    condition     = contains(["db.t3.micro", "db.t4g.micro"], var.instance_class)
    error_message = "Only instances of classes 'db.t3.micro' & 'db.t4g.micro' are allowed."
  }
}

variable "storage_size" {
  type        = number
  default     = 10
  description = "The amount of storage to allocate to the RDS instance. Should be between 5GB and 10GB."

  validation {
    condition     = var.storage_size >= 5 && var.storage_size <= 10
    error_message = "DB storage must be between 5GB & 10GB"
  }

}

variable "engine" {
  type        = string
  default     = "postgres-latest"
  description = "Which engine to use for the RDS instance. Currently only postgres is supported."

  validation {
    condition     = contains(["postgres-latest", "postgres-14"], var.engine)
    error_message = "The DB engine must be 'postgres-latest' or 'postgres-14'"
  }

}

########################
# DB credentials
########################

variable "credentials" {
  type = object({
    username = string
    password = string
  })

  sensitive   = true
  description = "The root username and password for the RDS instance creation."

  validation {
    condition = (
      length(regexall("[a-zA-Z]+", var.credentials.password)) > 0
      && length(regexall("[0-9]+", var.credentials.password)) > 0
      && length(regexall("^[a-zA-Z0-9+_?-]{8,}$", var.credentials.password)) > 0
    )
    error_message = <<-EOT
    Password must comply with the following format:

    1. Contain at least 1 character
    2. Contain at least 1 digit
    3. Be at least 8 characters long
    4. Contain only the following characters: a-z, A-Z, 0-9, +, _, ?, -
    EOT
  }
}

########################
# DB network
########################


variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs to deploy the RDS instance in."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach to the RDS instance."
}

########################
# DB Backup
########################

variable "backup_retention_period" {
  type        = number
  description = "The ammount of days to keep a DB backup."

  validation {
    condition     = var.backup_retention_period >= 0 && var.backup_retention_period <= 35
    error_message = "Retention period must be between 0 and 35 days."
  }
}

variable "backup_window" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created. Format: '09:45-10:20'."

  validation {
    condition     = can(regex("^([01][0-9]|2[0-3]):[0-5][0-9]-([01][0-9]|2[0-3]):[0-5][0-9]$", var.backup_window))
    error_message = "backup_window must be in the format HH:MM-HH:MM using 24-hour time (e.g., 09:46-10:16)."
  }
}

variable "maintenance_window" {
  type        = string
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"

  validation {
    condition = can(
      regex(
        "^(Mon|Tue|Wed|Thu|Fri|Sat|Sun):([01][0-9]|2[0-3]):[0-5][0-9]-(Mon|Tue|Wed|Thu|Fri|Sat|Sun):([01][0-9]|2[0-3]):[0-5][0-9]$",
        var.maintenance_window
      )
    )
    error_message = "maintenance_window must be in the format 'Mon:00:00-Mon:03:00', using 24-hour time and valid weekday abbreviations."
  }
}