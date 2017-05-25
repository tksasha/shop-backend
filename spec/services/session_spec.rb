require 'rails_helper'

RSpec.describe Session, type: :model do
  subject { described_class.new email: 'one@digits.com', password: 'password' }

  it { should delegate_method(:user_id).to(:user).as(:id) }

  describe '#user' do
    before { expect(Profile).to receive(:find_by).with(email: 'one@digits.com').and_return(:user) }

    its(:user) { should eq :user }
  end

  describe '#valid?' do
    context do
      before { allow(Profile).to receive(:find_by).with(email: 'one@digits.com').and_return(nil) }

      before { subject.valid? }

      it { should_not be_valid }

      it { expect(subject.errors[:email]).to eq ['invalid email or password'] }
    end

    context do
      let(:user) { double }

      before { expect(Profile).to receive(:find_by).with(email: 'one@digits.com').and_return(user) }

      before { expect(user).to receive(:authenticate).with('password').and_return(false) }

      before { subject.valid? }

      it { expect(subject.errors[:password]).to eq ['invalid email or password'] }
    end

    context do
      let(:user) { double }

      before { expect(Profile).to receive(:find_by).with(email: 'one@digits.com').and_return(user) }

      before { expect(user).to receive(:authenticate).with('password').and_return(true) }

      it { should be_valid }
    end
  end

  describe '#save' do
    context do
      before { expect(subject).to receive(:valid?).and_return(false) }

      before { subject.save }

      its(:persisted?) { should eq false }
    end

    context do
      before { expect(subject).to receive(:valid?).and_return(true) }

      before { subject.save }

      its(:persisted?) { should eq true }
    end
  end

  describe '#destroy' do
    it { expect { subject.destroy }.to_not raise_error }
  end
end
