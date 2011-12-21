module ChatFaye
  def self.broadcast(channel, data)
    begin
      message = {:channel => channel, :data => data, :ext => {:auth_token => Settings.faye_token}}
      uri = URI.parse(Settings.faye_server_url)
      Net::HTTP.post_form(uri, :message => message.to_json)
    rescue Errno::ECONNREFUSED       
    end
  end
end