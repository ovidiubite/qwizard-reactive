json.extract! answer, :id, :title, :is_correct, :created_at, :updated_at
json.url answer_url(answer, format: :json)
