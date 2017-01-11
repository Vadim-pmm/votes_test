class Question < ApplicationRecord
  has_many :answers
  has_many :possible_answers

  validates :name, presence: true, uniqueness: true
end
