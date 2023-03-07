# frozen_string_literal: true

require "spec_helper"

RSpec.describe do
  describe RCSpec::Core::Example do
    let(:example) { described_class.new(description, block) }
    let(:block) { proc { :wow! } }
    let(:description) { "description" }

    describe "#run" do
      context "when expectation raises no error" do
        it "returns a passing Result" do
          result = example.run
          expect(result.description).to eq "description"
          expect(result.pass).to be true
        end
      end

      context "when expectation returns a FailedExpectationError" do
        let(:block) { proc { raise RCSpec::Matchers::FailedExpectationError.new(:foo, :bar) } }

        it "returns a failing Result" do
          result = example.run
          expect(result.pass).to be false
        end
      end

      context "when expectation raises an unexpected error" do
        let(:block) { proc { 3 / 0 } }

        it "surfaces the raised error" do
          expect { example.run }.to raise_error(ZeroDivisionError)
        end
      end
    end

    describe "#expect" do
      context "when passed a value" do
        it "returns an Expectation with proc wrapping value" do
          expectation = example.send(:expect, :foo)
          expect(expectation).to be_a RCSpec::Core::Expecation
          expect(expectation.run).to eq :foo
        end
      end

      context "when passed a block" do
        it "returns an Expectation with block passed" do
          expectation = example.send(:expect) { :foo }
          expect(expectation).to be_a RCSpec::Core::Expecation
          expect(expectation.run).to eq :foo
        end
      end
    end
  end
end
