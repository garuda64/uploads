module NoticiaHelper
	def cache_record(record)
		path = "public/DatasB/records/#{record.id}.json"
		content = record.to_json
		File.open(path, "w+") do |f|
		  f.write(content)
		end
	end
end
