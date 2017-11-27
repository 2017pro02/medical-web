require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe "GET #show" do
    subject { get :show, params: params }

    context "存在するnameでアクセスした時" do
      let(:params) { { name: user.username } }
      it_behaves_like "ログイン画面に遷移する"
    end

    context "存在しないnameでアクセスした時" do
      let(:params) { { name: "@sachiko" } }
      it_behaves_like "ログイン画面に遷移する"
    end
  end
end
