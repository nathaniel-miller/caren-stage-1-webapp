json.extract! task, :id, :description, :expiration_date, :completed, :completed_by_id, :category_id, :created_by_id, :task_generator_id, :circle_id, :created_at, :updated_at
json.url task_url(task, format: :json)
