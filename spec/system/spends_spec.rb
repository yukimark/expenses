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
        visit spends_path
        expect(page).not_to have_content '適当'
      end
    end
  end

  describe '出費を入力できる' do
    let(:user_a) { FactoryBot.create(:user, email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, email: 'b@example.com') }

    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '金額欄を入力した時' do
      let(:login_user) { user_a }

      before do
        visit spends_path
        fill_in '金額', with: '111'
        click_button '登録する'
      end

      it '保存されることを確認' do
        expect(page).to have_content '保存しました。'
      end
    end

    context '金額欄を入力しない時' do
      let(:login_user) { user_a }

      before do
        visit spends_path
        click_button '登録する'
      end

      it '保存されないことを確認' do
        expect(page).to have_content '金額を入力してください'
      end
    end
    
  end
end
