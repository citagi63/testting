variable "domain_name" {
  type        = string
  description = "Domain name for opensearch"
}
variable "elasticsearch_version" {
    type        = string
    description = "Elasticsearch version"
}
 variable "instance_type" {
    type        = string
    description = "Instance type for elastic serach instace"
 }
 variable "instance_count" {
    type        = number
    description = "enter number of instace requied"
 }
 variable "ebs_enabled"{
    type        = bool
    description = "where need Ebs volume or not"
 }
 variable "volume_size"{
    type        = number
    description = "Size of ebs volume needed"
 }
 variable "volume_type" {
    type        = string
    description = "Ebs Volume type"
 }
 variable "enforce_https" {
    type        = bool
    default     = true
    description = "Whether or not to require HTTPS"
}
 variable "tls_security_policy" {
    type        = string
    default     =  "Policy-Min-TLS-1-0-2019-07"
    description = "Name of the TLS security policy that needs to be applied to the HTTPS endpoint."
 }
  variable "master_user_name" {
  type        = string
  description = "Name of the master user within this Opensearch cluster."
}
variable "master_user_password"  {
    type = string
    description = "Set password for master user"
}
variable "include_numbers" {
  type        = bool
  default     = true
  description = "Whether or not to include numbers in the password."
}
variable "dedicated_master_enabled" {
  type        =  bool
  description = "Whether dedicated main nodes are enabled for the cluster."
}
variable "internal_user_database_enabled" {
    type       = bool
    description = "internal user for database"
}
variable "subnet_id" {
    type       = string
}

