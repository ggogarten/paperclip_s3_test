class Post < ActiveRecord::Base

has_attached_file :image, styles: {
  small: "64x64",
  med: "200x200",
  large: "400x400"
}

validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

# def self.enroll
#
#   person = #username
#   house = #housename
#   url1 = #amazon s3 link
#
#   body = {:image => url1, :subject_id => person, :gallery_name => house, :selector => "SETPOSE", :symmetricFill => "true"  }
#   body = body.to_json
#
#   headers = {
#     :content_type => 'application/json',
#     :app_id => ENV['KAIROS_ID'],
#     :app_key => ENV['KAIROS_KEY']
#   }
#
#   response = HTTParty.post('https://api.kairos.com/enroll', { headers: headers, body: body })
#   puts response
# end





end
