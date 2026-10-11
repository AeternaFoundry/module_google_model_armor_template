resource "google_model_armor_template" "model_armor_templates" {
  for_each = var.model_armor_templates

  location        = each.value.location
  template_id     = each.value.template_id
  deletion_policy = each.value.deletion_policy
  labels          = each.value.labels
  project         = each.value.project

  filter_config {
    dynamic "malicious_uri_filter_settings" {
      for_each = each.value.filter_config.malicious_uri_filter_settings != null ? [each.value.filter_config.malicious_uri_filter_settings] : []
      content {
        filter_enforcement = malicious_uri_filter_settings.value.filter_enforcement
      }
    }
    dynamic "pi_and_jailbreak_filter_settings" {
      for_each = each.value.filter_config.pi_and_jailbreak_filter_settings != null ? [each.value.filter_config.pi_and_jailbreak_filter_settings] : []
      content {
        confidence_level   = pi_and_jailbreak_filter_settings.value.confidence_level
        filter_enforcement = pi_and_jailbreak_filter_settings.value.filter_enforcement
      }
    }
    dynamic "rai_settings" {
      for_each = each.value.filter_config.rai_settings != null ? [each.value.filter_config.rai_settings] : []
      content {
        dynamic "rai_filters" {
          for_each = rai_settings.value.rai_filters
          content {
            confidence_level = rai_filters.value.confidence_level
            filter_type      = rai_filters.value.filter_type
          }
        }
      }
    }
    dynamic "sdp_settings" {
      for_each = each.value.filter_config.sdp_settings != null ? [each.value.filter_config.sdp_settings] : []
      content {
        dynamic "advanced_config" {
          for_each = sdp_settings.value.advanced_config != null ? [sdp_settings.value.advanced_config] : []
          content {
            deidentify_template = advanced_config.value.deidentify_template
            inspect_template    = advanced_config.value.inspect_template
          }
        }
        dynamic "basic_config" {
          for_each = sdp_settings.value.basic_config != null ? [sdp_settings.value.basic_config] : []
          content {
            filter_enforcement = basic_config.value.filter_enforcement
          }
        }
      }
    }
  }

  dynamic "template_metadata" {
    for_each = each.value.template_metadata != null ? [each.value.template_metadata] : []
    content {
      custom_llm_response_safety_error_code    = template_metadata.value.custom_llm_response_safety_error_code
      custom_llm_response_safety_error_message = template_metadata.value.custom_llm_response_safety_error_message
      custom_prompt_safety_error_code          = template_metadata.value.custom_prompt_safety_error_code
      custom_prompt_safety_error_message       = template_metadata.value.custom_prompt_safety_error_message
      enforcement_type                         = template_metadata.value.enforcement_type
      dynamic "filter_version_selector" {
        for_each = template_metadata.value.filter_version_selector != null ? [template_metadata.value.filter_version_selector] : []
        content {
          alias   = filter_version_selector.value.alias
          version = filter_version_selector.value.version
        }
      }
      ignore_partial_invocation_failures = template_metadata.value.ignore_partial_invocation_failures
      log_sanitize_operations            = template_metadata.value.log_sanitize_operations
      log_template_operations            = template_metadata.value.log_template_operations
      dynamic "multi_language_detection" {
        for_each = template_metadata.value.multi_language_detection != null ? [template_metadata.value.multi_language_detection] : []
        content {
          enable_multi_language_detection = multi_language_detection.value.enable_multi_language_detection
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

