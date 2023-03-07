# frozen_string_literal: true

require "spec_helper"

RSpec.describe do
  describe RCSpec::Core::Description do
    subject { described_class.new(description, block) }
    let(:description) { "wow" }
    let(:block) { proc { :wow } }

    describe "#run" do
      context "w/o calls to #it" do
        it "returns a Result with an empty results array" do
          result = subject.run
          expect(result).to be_a RCSpec::Core::Description::Result
          expect(result.description).to eq "wow"
          expect(result.results).to match_array []
        end
      end

      context "w/ calls to #it" do
        let(:block) do
          proc do
            it "passes" do
              :woo
            end

            it "fails" do
              raise RCSpec::Matchers::FailedExpectationError.new(:foo, :bar)
            end
          end
        end

        it "records results of each it block" do
          results = subject.run.results
          expect(results.length).to eq 2
          expect(results.first.description).to eq "passes"
          expect(results.first.pass).to be true
          expect(results.last.description).to eq "fails"
          expect(results.last.pass).to be false
        end
      end
    end
  end
end
