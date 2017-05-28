require 'rails_helper'

describe UserPolicy do
  subject { described_class }

  permissions :new?, :create? do
    context do
      let(:user) { nil }

      let(:resource) { User.new }

      it { should permit user, resource }
    end

    context do
      let(:user) { User.new }

      let(:resource) { User.new }

      it { should_not permit user, resource }
    end
  end

  permissions :show? do
    context do
      let(:user) { nil }

      let(:resource) { User.new }

      it { should_not permit user, resource }
    end

    context do
      let(:user) { User.new id: 2 }

      let(:resource) { User.new id: 1 }

      it { should_not permit user, resource }
    end

    context do
      let(:user) { User.new id: 1 }

      let(:resource) { User.new id: 1 }

      it { should permit user, resource }
    end
  end
end