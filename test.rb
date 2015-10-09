require 'combine_pdf'
pdf = CombinePDF.new
@profiles = Profile.where(year: "2018")
		@profiles.each do |profile|
			if profile.resume
				pdf << CombinePDF.parse(Net::HTTP.get(URI.parse(profile.resume)))
			end
		end
		#send_data pdf.to_pdf, filename: "combined_resume_book.pdf", type: "application/pdf"

		file_name = "combined.pdf"

		AWS.config(
	    	:access_key_id => ENV["AWS_KEY"], 
	    	:secret_access_key => ENV["AWS_SECRET"]
	    )
	  
	    bucket_name = 'thrpoaraos'

	    s3 = AWS::S3.new

	    object = s3.buckets[bucket_name].objects[file_name].write(:file => pdf.to_pdf, :server_side_encryption => :aes256)

		