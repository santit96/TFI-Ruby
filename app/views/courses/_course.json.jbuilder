json.extract! course, :id, :year, :name, :created_at, :updated_at
json.url course_url(course, format: :json)
