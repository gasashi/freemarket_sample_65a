class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,255}\z/i
  VALID_kanji = /\A[一-龥\ァ-ン\ぁ-ん]+\z/
  VALID_KATAKANA_REGEX =  /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_POSTAL_CODE = /\A\d{3}-?\d{4}\z/

  validates :first_name, presence: true, on: :validates_step3, format: { with: VALID_kanji, message: 'は有効でありません' }, on: :validates_step3
  validates :last_name, presence: true, on: :validates_step3, format: { with: VALID_kanji, message: 'は有効でありません' }, on: :validates_step3
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}, on: :validates_step3
  validates :last_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}, on: :validates_step3
  validates :post_number, presence: true, format: { with: /\A\d{3}\-?\d{4}\z/, message: 'はハイフンなしで入力して下さい' }, on: :validates_step3
  validates :prefecture_id, presence: true, on: :validates_sttep3
  validates :city, presence: true, on: :validates_step3
  validates :address_number, presence: true, on: :validates_step3
  validates :building, allow_blank: true, length: { maximum: 100 }, on: :validates_step3
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX, message: 'は有効でありません'}, allow_blank: true, on: :validates_step3

end
