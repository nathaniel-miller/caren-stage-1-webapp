class Circle < ApplicationRecord
  belongs_to :super_admin, class_name: 'User'
  has_many :positions
  has_many :task_generators
  has_many :important_info_pieces
  has_many :posts
  has_many :tasks
end
