class Answer < ApplicationRecord
  belongs_to :poll
  belongs_to :question

end
