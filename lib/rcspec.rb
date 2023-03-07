# frozen_string_literal: true

require_relative "rcspec/core/description"
require_relative "rcspec/core/example"
require_relative "rcspec/core/expectation"
require_relative "rcspec/execution/runner"
require_relative "rcspec/execution/file_runner"
require_relative "rcspec/execution/directory_runner"
require_relative "rcspec/execution/output"
require_relative "rcspec/matchers/evaluator"
require_relative "rcspec/matchers/failed_expectation_error"
require_relative "rcspec/matchers/matchable"
require_relative "rcspec/version"

module RCSpec
  def describe(description, &blk)
    @results ||= []
    @results << RCSpec::Core::Description.new(description, blk).run
  end
end
