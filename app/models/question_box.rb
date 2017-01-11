class QuestionBox < ApplicationRecord
  has_many :questions
  has_many :polls

  validates :name, presence: true, uniqueness: true
end
