# frozen_string_literal: true

require "spec_helper"

RSpec.describe do
  describe RCSpec::Matchers::Matchable do
    subject { described_class.new(:wow) }

    describe "matchers" do
      let(:expected) { :wow }
      let(:evaluator) { instance_double(RCSpec::Matchers::Evaluator) }

      it "instantiates an Evaluator with the proper comparator and calls run" do
        [
          %i[eq ==],
          %i[include include?],
          %i[raise_error raise_error]
        ].each do |method, comparator|
          allow(RCSpec::Matchers::Evaluator).to receive(:new).with(:wow, expected, comparator).and_return evaluator
          expect(evaluator).to receive(:run)
          subject.send(method, expected)
        end
      end
    end
  end
end
