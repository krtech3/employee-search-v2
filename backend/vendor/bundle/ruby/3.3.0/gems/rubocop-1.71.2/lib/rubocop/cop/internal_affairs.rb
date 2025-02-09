# frozen_string_literal: true

require_relative 'internal_affairs/cop_description'
require_relative 'internal_affairs/cop_enabled'
require_relative 'internal_affairs/create_empty_file'
require_relative 'internal_affairs/empty_line_between_expect_offense_and_correction'
require_relative 'internal_affairs/example_description'
require_relative 'internal_affairs/example_heredoc_delimiter'
require_relative 'internal_affairs/inherit_deprecated_cop_class'
require_relative 'internal_affairs/lambda_or_proc'
require_relative 'internal_affairs/location_expression'
require_relative 'internal_affairs/location_line_equality_comparison'
require_relative 'internal_affairs/method_name_end_with'
require_relative 'internal_affairs/method_name_equal'
require_relative 'internal_affairs/node_destructuring'
require_relative 'internal_affairs/node_first_or_last_argument'
require_relative 'internal_affairs/node_matcher_directive'
require_relative 'internal_affairs/node_pattern_groups'
require_relative 'internal_affairs/node_type_multiple_predicates'
require_relative 'internal_affairs/node_type_predicate'
require_relative 'internal_affairs/numblock_handler'
require_relative 'internal_affairs/offense_location_keyword'
require_relative 'internal_affairs/on_send_without_on_csend'
require_relative 'internal_affairs/operator_keyword'
require_relative 'internal_affairs/processed_source_buffer_name'
require_relative 'internal_affairs/redundant_context_config_parameter'
require_relative 'internal_affairs/redundant_described_class_as_subject'
require_relative 'internal_affairs/redundant_expect_offense_arguments'
require_relative 'internal_affairs/redundant_let_rubocop_config_new'
require_relative 'internal_affairs/redundant_location_argument'
require_relative 'internal_affairs/redundant_message_argument'
require_relative 'internal_affairs/redundant_method_dispatch_node'
require_relative 'internal_affairs/redundant_source_range'
require_relative 'internal_affairs/single_line_comparison'
require_relative 'internal_affairs/style_detected_api_use'
require_relative 'internal_affairs/undefined_config'
require_relative 'internal_affairs/useless_message_assertion'
require_relative 'internal_affairs/useless_restrict_on_send'

module RuboCop
  # Patch in the InternalAffairs specific config values
  module InternalAffairs
    def self.inject!
      path = File.join(ConfigLoader::RUBOCOP_HOME, 'config', 'internal_affairs.yml')
      hash = ConfigLoader.load_yaml_configuration(path)
      config = Config.new(hash, path)
      puts "configuration from #{path}" if ConfigLoader.debug?
      config = ConfigLoader.merge_with_default(config, path)
      ConfigLoader.instance_variable_set(:@default_configuration, config)
    end
  end
end

RuboCop::InternalAffairs.inject!
