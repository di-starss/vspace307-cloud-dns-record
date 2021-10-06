//
// CORE
//
terraform {
  required_providers {
    powerdns = {
      source = "ag-TJNII/powerdns"
      version = "101.6.1"
    }
  }
}


//
// VARIABLES
//
variable "zone" {
  type = string
}

variable "record" {
  type = string
}

variable "ip" {
  type = string
}

//
// Record
//

// record: slave-0.dev.core.vdb.ams1.vspace307.io A 172.22.86.13

resource "powerdns_record" "record" {
  zone    = var.zone
  name    = var.record
  type    = "A"
  ttl     = 300
  records = [var.ip]
}
