class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 何かを登録するときのエラーメッセージ
  def error_message
    self.errors.full_messages.join(',')
  end
end
