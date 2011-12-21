require 'faye'
#require File.expand_path('../../../config/initializers/faye_token.rb', __FILE__)
FAYE_TOKEN = "433fgfgdfgdo3"

class ServerAuth
  def incoming(message, callback)
   if message['channel'] !~ %r{^/meta/}
     if message['ext']['auth_token'] != FAYE_TOKEN
       message['error'] = 'Invalid authentication token'
     end
     
     message['ext']['auth_token'] = ''
     
   end
   callback.call(message)
  end
end

faye_server = Faye::RackAdapter.new(
  :mount => '/faye', 
  :timeout => 45
#  ,:engine  => {
#      :type       => 'redis',
#      :host       => 'localhost',
#      :port       => '6379'
#  }
  )
faye_server.listen(9292)
faye_server.add_extension(ServerAuth.new)
run faye_server