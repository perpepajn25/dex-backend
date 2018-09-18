class User < ApplicationRecord

  has_secure_password
  has_many :user_decks
  has_many :decks, through: :user_decks
  has_many :cards, through: :decks
  has_many :stars
  validates :username, uniqueness: true

  def for_login
    {
      id: self.id,
      username: self.username,
      decks: self.formatted_decks
    }
  end

  def formatted_decks
    self.decks.map(&:formatted)
  end

end
