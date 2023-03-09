# frozen_string_literal: true

module RCSpec
  module Execution
    class Runner
      class << self
        def from_path(path)
          return FileRunner.new(path).run unless File.directory?(path)

          DirectoryRunner.new(path).run
        end
      end
    end
  end
end
