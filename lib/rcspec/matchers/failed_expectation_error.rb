# frozen_string_literal: true

module RCSpec
  module Matchers
    class FailedExpectationError < StandardError
      def initialize(expected, received)
        msg = "Expectation failed. Expected: #{expected} | Received #{received}\n"
        super(msg)
      end
    end
  end
end
