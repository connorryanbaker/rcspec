# frozen_string_literal: true

module RCSpec
  module Core
    class Description
      Result = Struct.new(:description, :results)

      def initialize(description, block)
        @description = description
        @block = block
        @results = []
      end

      def run
        instance_eval(&block)
        Result.new(description, results)
      end

      private

      def it(description, &blk)
        results << Example.new(description, blk).run
      end

      attr_reader :description, :block, :results
    end
  end
end
