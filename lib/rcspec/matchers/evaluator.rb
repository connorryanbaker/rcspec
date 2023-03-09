# frozen_string_literal: true

module RCSpec
  module Matchers
    class Evaluator
      def initialize(expectation, expected, comparison)
        @expectation = expectation
        @expected = expected
        @comparison = comparison
      end

      def run
        return run_with_rescue if comparison == :raise_error

        received = expectation.run
        pass = received.send(comparison, expected)
        raise RCSpec::Matchers::FailedExpectationError.new(expected, received) unless pass
      end

      private

      def run_with_rescue
        received = nil
        expectation.run
      rescue StandardError => e
        received = e.class
      ensure
        raise RCSpec::Matchers::FailedExpectationError.new(expected, received) unless expected == received
      end

      attr_reader :expectation, :expected, :comparison
    end
  end
end
