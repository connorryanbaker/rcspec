# frozen_string_literal: true

require "spec_helper"

RSpec.describe do
  describe RCSpec::Matchers::Evaluator do
    subject { described_class.new(expectation, expected, comparison) }

    describe "#run" do
      let(:expectation) { double(run: :foo) }
      let(:expected) { :foo }
      let(:comparison) { :== }

      context "for passing expectations" do
        it "returns nil" do
          expect(subject.run).to be_nil
        end
      end

      context "for failing expectations" do
        let(:comparison) { :!= }

        it "raises a FailedExpectationError" do
          expect { subject.run }.to raise_error(RCSpec::Matchers::FailedExpectationError)
        end
      end

      context "when comparison is :raise_error" do
        let(:comparison) { :raise_error }

        it "returns :run_with_rescue method call" do
          expect(subject).to receive(:run_with_rescue).and_return :wow
          expect(subject.run).to eq :wow
        end

        context "when comparing error classes" do
          let(:comparison) { :raise_error }
          before(:each) { allow(expectation).to receive(:run).and_raise(ZeroDivisionError) }

          context "when expectation raises expected error class" do
            let(:expected) { ZeroDivisionError }

            it "does not raise a FailedExpectationError" do
              expect { subject.run }.not_to raise_error
            end
          end

          context "when expectation raises unexpected error" do
            let(:expected) { ArgumentError }

            it "raises a FailedExpectationError" do
              expect { subject.run }.to raise_error(RCSpec::Matchers::FailedExpectationError)
            end
          end
        end
      end
    end
  end
end
