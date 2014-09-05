collection @translations, object_root: false
attributes :id, :user_id, :section, :times_right, :times_wrong, :times_skiped, :times_resetted, :created_at, :updated_at
child(word1: "word1") do
	attributes :name, :id
	child :language do
		attributes :id, :name
	end
end
child(word2: "word2") do
	attributes :name, :id
	child :language do
		attributes :id, :name
	end
end