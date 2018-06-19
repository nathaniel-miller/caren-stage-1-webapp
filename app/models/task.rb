class Task < ApplicationRecord
  belongs_to :category
  belongs_to :task_generator, optional: true
  belongs_to :circle
  belongs_to :created_by, class_name: 'User'
  belongs_to :completed_by, class_name: 'User', optional: true
end
