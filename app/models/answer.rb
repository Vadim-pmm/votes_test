class Answer < ApplicationRecord
  belongs_to :reply
  belongs_to :question

end
