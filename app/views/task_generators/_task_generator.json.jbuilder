json.extract! task_generator, :id, :description, :category_id, :circle_id, :created_by, :mandatory, :every_n, :sun, :mon, :tues, :wed, :thurs, :fri, :sat, :part_of_day, :custom_time, :last_run, :look_ahead, :created_at, :updated_at
json.url task_generator_url(task_generator, format: :json)
