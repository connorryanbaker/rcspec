# frozen_string_literal: true

module RCSpec
  module Core
    class Expecation
      def initialize(subject)
        @subject = subject
      end

      def to
        RCSpec::Matchers::Matchable.new(self)
      end

      def run
        subject.call
      end

      private

      attr_reader :subject
    end
  end
end
