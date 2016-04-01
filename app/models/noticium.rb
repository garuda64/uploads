class Noticium < ActiveRecord::Base
	after_save :cache_record

	def cache_record
		path = "public/DatasB/records/#{self.id}.json"
		content = self.to_json
		File.open(path, "w+") do |f|
		  f.write(content)
		end
	end
end
