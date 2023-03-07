# frozen_string_literal: true

module RCSpec
  module Matchers
    class Matchable
      def initialize(expectation)
        @expectation = expectation
      end

      def eq(expected)
        Evaluator.new(expectation, expected, :==).run
      end

      def include(expected)
        Evaluator.new(expectation, expected, :include?).run
      end

      def raise_error(expected)
        Evaluator.new(expectation, expected, :raise_error).run
      end

      private

      attr_reader :expectation
    end
  end
end
