# frozen_string_literal: true

module RCSpec
  module Core
    class Example
      def initialize(description, block)
        @description = description
        @block = block
      end

      def run
        instance_eval(&block)
        Result.new(description, true, nil)
      rescue RCSpec::Matchers::FailedExpectationError => e
        Result.new(description, false, e)
      end

      private

      def expect(subject = nil, &blk)
        subject_proc = subject ? proc { subject } : blk
        Expecation.new(subject_proc)
      end

      Result = Struct.new(:description, :pass, :error)

      attr_reader :description, :block
    end
  end
end
