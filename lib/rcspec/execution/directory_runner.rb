# frozen_string_literal: true

module RCSpec
  module Execution
    class DirectoryRunner
      def initialize(path)
        @path = path
        @results = []
      end

      def run
        entries.each do |entry|
          results << Runner.from_path(File.join(path, entry))
        end

        results
      end

      private

      def entries
        Dir.entries(path).reject { |e| %w[. ..].include?(e) }
      end

      attr_reader :path, :results
    end
  end
end
