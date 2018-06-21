class Position < ApplicationRecord
  belongs_to :role
  belongs_to :circle
  belongs_to :user, optional: true
  has_one :invitation, dependent: :destroy
end
