module Xeroizer
  module Report
    class TenNinetyNine < Base

      attr_accessor :contacts

      def initialize(factory)
        @contacts = []
        super
      end

      def self.build_from_node(node,factory)
        report = super(node, factory)
        model = Xeroizer::Record::ContactModel.new('','Contact')
        report.contacts = (node/'Contact').map do |contact|
          Xeroizer::Record::Contact.build_from_node(contact,model)
        end
        report
      end
    end
  end
end
