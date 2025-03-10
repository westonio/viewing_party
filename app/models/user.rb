class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true
  has_secure_password

  def movie_party_ids
    viewing_parties.pluck(:movie_id)
  end
end
