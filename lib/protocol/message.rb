require 'securerandom'

module Protocol
  class Message
    class << self
      def build(message)
        new(message)
      end
    end

    attr_accessor *%i(version format site_id correlation_id body)

    def initialize(message, **args)
      @version        = args[:version] || 1
      @format         = args[:format]  || 'J'
      @site_id        = args[:site_id] || 3
      @correlation_id = args[:correlation_id] || SecureRandom.random_bytes(10)
      @body           = message
    end

    def to_s
      byte_buffer = ''
      byte_buffer += [@version].pack('C')
      byte_buffer += @format
      byte_buffer += [@site_id].pack('Q')
      byte_buffer += @correlation_id

      byte_buffer
    end
  end
end