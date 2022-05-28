require 'rails_helper'

describe 'サインアップできるか', type: :system do
  before do
    visit new_user_registration_path
  end

  context 'ちゃんと入力した時' do
    before do
      fill_in 'メールアドレス', with: 'a@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in '確認用パスワード', with: 'password'
      click_button 'アカウント登録'
    end
    
    it 'ユーザーが作成される' do
      expect(page).to have_content 'アカウント登録が完了しました。'
    end
  end
end
