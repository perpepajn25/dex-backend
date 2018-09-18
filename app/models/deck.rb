class Deck < ApplicationRecord

  has_many :cards, :dependent => :destroy
  has_many :stars
  has_many :forks
  has_many :user_decks
  has_many :users, through: :user_decks

  def formatted
    {
      id: self.id,
      cards: self.cards,
      stars: self.stars,
      forks: self.forks
    }
  end

end
