class Poll < ApplicationRecord
  belongs_to :question_box
  has_many :answers

  validates :name, presence: true, uniqueness: true
end
