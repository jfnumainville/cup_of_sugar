class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :email, :address, presence: true
end
