output "model_armor_templates_id" {
  description = "Map of id values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no id are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "model_armor_templates_create_time" {
  description = "Map of create_time values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no create_time are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "model_armor_templates_deletion_policy" {
  description = "Map of deletion_policy values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no deletion_policy are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "model_armor_templates_effective_labels" {
  description = "Map of effective_labels values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no effective_labels are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "model_armor_templates_filter_config" {
  description = "Map of filter_config values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no filter_config are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => one(v.filter_config) if v.filter_config != null && length(v.filter_config) > 0 }
}
output "model_armor_templates_labels" {
  description = "Map of labels values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no labels are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "model_armor_templates_location" {
  description = "Map of location values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no location are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.location if v.location != null && length(v.location) > 0 }
}
output "model_armor_templates_name" {
  description = "Map of name values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no name are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "model_armor_templates_project" {
  description = "Map of project values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no project are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.project if v.project != null && length(v.project) > 0 }
}
output "model_armor_templates_template_id" {
  description = "Map of template_id values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no template_id are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.template_id if v.template_id != null && length(v.template_id) > 0 }
}
output "model_armor_templates_template_metadata" {
  description = "Map of template_metadata values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no template_metadata are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => one(v.template_metadata) if v.template_metadata != null && length(v.template_metadata) > 0 }
}
output "model_armor_templates_terraform_labels" {
  description = "Map of terraform_labels values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no terraform_labels are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "model_armor_templates_update_time" {
  description = "Map of update_time values across all model_armor_templates, keyed the same as var.model_armor_templates except keys with no update_time are omitted"
  value       = { for k, v in google_model_armor_template.model_armor_templates : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

