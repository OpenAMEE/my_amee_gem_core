require 'net/https'
require 'uri'

module Net
  
  class HTTP
    
    def self.get_with_https(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.port == 443
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      response = http.start do
        path = uri.path
        path += "?#{uri.query}" if uri.query
        http.get(path)
      end
    end
    
  end
  
end
