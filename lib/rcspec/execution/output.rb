# frozen_string_literal: true

module RCSpec
  module Execution
    class Output
      class << self
        def from_results(results)
          new(results)
        end
      end

      private

      PASS = "\e[32m.\e[0m"
      FAIL = "\e[31mF\e[0m"

      attr_reader :results

      def initialize(results)
        @results = results
        print_results
      end

      def print_results # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        failed = Hash.new { |h, k| h[k] = [] }
        total = 0

        results.each do |desc|
          desc.results.each do |example|
            total += 1

            if example.pass
              print PASS
            else
              print FAIL
              failed[desc.description] << example
            end
          end
        end

        puts "\n\n"

        failed.each do |description, failures|
          puts description
          failures.each do |failure|
            puts "\tit #{failure.description}"
            puts "\t#{failure.error}"
          end
        end

        puts "\n"

        puts "#{total} examples, #{failed.count} failures"
      end
    end
  end
end
