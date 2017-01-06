class Reply < ApplicationRecord
  belongs_to :question_box
  has_many :answers

end
