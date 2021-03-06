class Post < ActiveRecord::Base

  has_attached_file :image, styles: {
    small: "64x64",
    med: "200x200",
    large: "400x400"
  }

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.enroll(url)

    person = 'gisele'
    house = 'vsangeltest'
    url1 = url

    body = {:image => url1, :subject_id => person, :gallery_name => house, :selector => "SETPOSE", :symmetricFill => "true"  }
    body = body.to_json

    headers = {
      :content_type => 'application/json',
      :app_id => ENV['KAIROS_ID'],
      :app_key => ENV['KAIROS_KEY']
    }

    response = HTTParty.post('https://api.kairos.com/enroll', { headers: headers, body: body })
    puts response
  end

  def self.recognize(url)

    house = 'vsangeltest'
    lookup = url
    threshold = '0.75'

    body = {:image => lookup, :gallery_name => house, :threshold => threshold}
    body = body.to_json


    headers = {
      :content_type => 'application/json',
      :app_id => ENV['KAIROS_ID'],
      :app_key => ENV['KAIROS_KEY']
    }

    response = HTTParty.post('https://api.kairos.com/recognize', { body: body, headers: headers})

    response_short = response.parsed_response

    successtest = response_short['images'][0]['transaction']['status']
    p successtest
    successtest
    end
  end
