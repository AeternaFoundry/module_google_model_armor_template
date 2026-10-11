variable "model_armor_templates" {
  description = <<EOT
Map of model_armor_templates, attributes below
Required:
    - location
    - template_id
    - filter_config (block):
        - malicious_uri_filter_settings (optional, block):
            - filter_enforcement (optional)
        - pi_and_jailbreak_filter_settings (optional, block):
            - confidence_level (optional)
            - filter_enforcement (optional)
        - rai_settings (optional, block):
            - rai_filters (required, block):
                - confidence_level (optional)
                - filter_type (required)
        - sdp_settings (optional, block):
            - advanced_config (optional, block):
                - deidentify_template (optional)
                - inspect_template (optional)
            - basic_config (optional, block):
                - filter_enforcement (optional)
Optional:
    - deletion_policy
    - labels
    - project
    - template_metadata (block):
        - custom_llm_response_safety_error_code (optional)
        - custom_llm_response_safety_error_message (optional)
        - custom_prompt_safety_error_code (optional)
        - custom_prompt_safety_error_message (optional)
        - enforcement_type (optional)
        - filter_version_selector (optional, block):
            - alias (optional)
            - version (optional)
        - ignore_partial_invocation_failures (optional)
        - log_sanitize_operations (optional)
        - log_template_operations (optional)
        - multi_language_detection (optional, block):
            - enable_multi_language_detection (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location        = string
    template_id     = string
    deletion_policy = optional(string)
    labels          = optional(map(string))
    project         = optional(string)
    filter_config = object({
      malicious_uri_filter_settings = optional(object({
        filter_enforcement = optional(string)
      }))
      pi_and_jailbreak_filter_settings = optional(object({
        confidence_level   = optional(string)
        filter_enforcement = optional(string)
      }))
      rai_settings = optional(object({
        rai_filters = list(object({
          confidence_level = optional(string)
          filter_type      = string
        }))
      }))
      sdp_settings = optional(object({
        advanced_config = optional(object({
          deidentify_template = optional(string)
          inspect_template    = optional(string)
        }))
        basic_config = optional(object({
          filter_enforcement = optional(string)
        }))
      }))
    })
    template_metadata = optional(object({
      custom_llm_response_safety_error_code    = optional(number)
      custom_llm_response_safety_error_message = optional(string)
      custom_prompt_safety_error_code          = optional(number)
      custom_prompt_safety_error_message       = optional(string)
      enforcement_type                         = optional(string)
      filter_version_selector = optional(object({
        alias   = optional(string)
        version = optional(string)
      }))
      ignore_partial_invocation_failures = optional(bool)
      log_sanitize_operations            = optional(bool)
      log_template_operations            = optional(bool)
      multi_language_detection = optional(object({
        enable_multi_language_detection = bool
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.model_armor_templates : (
        v.filter_config.rai_settings == null || (length(v.filter_config.rai_settings.rai_filters) >= 1)
      )
    ])
    error_message = "Each rai_filters list must contain at least 1 items"
  }
}

