json.extract! lobby, :id, :code, :status, :current_question_index, :created_at, :updated_at
json.url lobby_url(lobby, format: :json)
