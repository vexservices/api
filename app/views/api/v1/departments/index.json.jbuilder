json.cache! cache_key_for_records('department', @departments) do
  json.departments @departments do |department|
    json.cache! ['V1', department] do
      json.id   department.id
      json.name department.name
    end
  end
end
