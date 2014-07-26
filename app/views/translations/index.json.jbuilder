json.array!(@translations) do |translation|
  json.extract! translation, :id, :word_id, :word_id, :times_right, :times_wrong, :times_skiped, :times_resetted
  json.url translation_url(translation, format: :json)
end
