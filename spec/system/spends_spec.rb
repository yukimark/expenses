require 'rails_helper'

describe '出費crud機能', type: :system do
  describe '一覧表示機能' do
    let(:user_a) { FactoryBot.create(:user, email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, email: 'b@example.com') }

    before do
      FactoryBot.create(:spend, content: '適当', user_id: user_a.id)
      visit new_user_session_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      it 'ユーザーAが作成した出費が表示される' do
        visit spends_path
        expect(page).to have_content '適当'
      end
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成した出費が表示されない' do
        expect(page).not_to have_content '適当'
      end
    end
  end
end
