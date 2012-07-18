require 'digest/md5'
require 'rest_client'
require 'json'

class GravatarProfile
  attr_accessor :name, :photo, :url
  def initialize(email)
    user_hash = Digest::MD5.hexdigest(email)
    response = JSON.parse(RestClient.get("http://gravatar.com/#{user_hash}.json"))
    profile = response['entry'].first
    @name, @photo, @url = profile['displayName'], profile['photos'].first['value'], profile['profileUrl']
  rescue
    @name, @photo, @url = 'Unknown', '', ''
  end
end
