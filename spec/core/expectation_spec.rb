# frozen_string_literal: true

require "spec_helper"

RSpec.describe do
  describe RCSpec::Core::Expecation do
    subject { described_class.new(subject_proc) }
    let(:subject_proc) { proc { :wow! } }

    describe "#to" do
      it "returns a Matchable" do
        expect(subject.to).to be_a(RCSpec::Matchers::Matchable)
      end
    end

    describe "#run" do
      it "calls subject proc" do
        expect(subject.run).to be :wow!
      end
    end
  end
end
