class ChronologyTestAnswer < ApplicationRecord
  validates :name,  presence: true, uniqueness: true
  VALID_ANSWER_REGEX = /\A[\d ]*\d\z/
  validates :answer, presence: true, format: { with: VALID_ANSWER_REGEX }

  has_secure_password
  validates :password, presence: true
end
