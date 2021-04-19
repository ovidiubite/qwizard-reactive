json.extract! question, :id, :title, :time_limit, :points, :answer_type, :order, :created_at, :updated_at
json.url question_url(question, format: :json)
