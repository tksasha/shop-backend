require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe '#resource_params' do
    let(:params) do
      { profile: { email: 'one@digits.com', password: 'password', password_confirmation: 'password' } }
    end

    before { expect(subject).to receive(:params).and_return(acp params) }

    its(:resource_params) { should eq permit! params[:profile] }
  end

  it_behaves_like :new

  it_behaves_like :show do
    before { expect(subject).to receive(:authorize_user) }
  end

  it_behaves_like :create do
    let(:resource) { stub_model Profile }

    before { expect(subject).to receive(:login_user) }

    let(:success) { -> { should redirect_to resource } }

    let(:failure) { -> { should render_template :new } }
  end
end
