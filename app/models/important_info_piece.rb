class ImportantInfoPiece < ApplicationRecord
  belongs_to :category
  belongs_to :circle
  belongs_to :created_by, class_name: 'User'
end
