class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  has_one :mark
end
