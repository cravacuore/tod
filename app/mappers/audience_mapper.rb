require 'dm-core'
require_relative '../models/audience'

module DataMapper
  class Property
    class AudienceMapper < String

      length 20

      def custom?
        true
      end

      def primitive?(value)
        value.kind_of?(::Audience)
      end

      def valid?(value, negated = false)
        super || primitive?(value) || value.kind_of?(::String)
      end

      def load(value)
        Audience.new(value.to_sym)
      end

      def dump(value)
        value.to_s unless value.nil?
      end

      def typecast_to_primitive(value)
        load(value)
      end

    end
  end
end