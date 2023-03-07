# frozen_string_literal: true

module RCSpec
  module Execution
    class FileRunner
      def initialize(file)
        @file = file
      end

      def run
        mod = Module.new do
          extend RCSpec
        end

        mod.instance_eval(contents)
      end

      private

      attr_reader :file

      def contents
        @contents ||= File.read(file)
      end
    end
  end
end
