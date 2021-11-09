class Question < ApplicationRecord
  belongs_to :exercice
  #belongs_to :user
  has_many :answers, dependent: :destroy
  
  accepts_nested_attributes_for :answers
  #validates_with QuestionValidator
end
