class QuestionBox < ApplicationRecord
  has_many :questions
  has_many :replies

  validates :name, presence: true, uniqueness: true
end
