json.cache! cache_key_for_super_departments(@departments) do
  json.departments @departments do |department|
    json.cache! ['V1', department] do
      json.id   department.id
      json.name department.name
    end

    json.departments department.departments.each do |sub|
      json.cache! ['V1', 'sub-department', department] do
        json.id   sub.id
        json.name sub.name
      end
    end
  end
end
