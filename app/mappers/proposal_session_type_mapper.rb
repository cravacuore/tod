require_relative '../models/proposal_session_type'
require 'dm-core'

module DataMapper
  class Property
    class ProposalSessionTypeMapper < String

      length 20

      def custom?
        true
      end

      def primitive?(value)
        value.kind_of?(::ProposalSessionType)
      end

      def valid?(value, negated = false)
        super || primitive?(value) || value.kind_of?(::String)
      end

      def load(value)
        ProposalSessionType.new(value.to_sym)
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