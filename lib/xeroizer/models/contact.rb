require "xeroizer/models/contact_person"

module Xeroizer
  module Record

    class ContactModel < BaseModel

      set_permissions :read, :write, :update

    end

    class Contact < Base

      CONTACT_STATUS = {
        'ACTIVE' =>     'Active',
        'DELETED' =>    'Deleted'
      } unless defined?(CONTACT_STATUS)

      set_primary_key :contact_id
      set_possible_primary_keys :contact_id, :contact_number
      list_contains_summary_only true

      guid          :contact_id
      string        :contact_number
      string        :contact_status
      string        :name
      string        :tax_number
      string        :bank_account_details
      string        :accounts_receivable_tax_type
      string        :accounts_payable_tax_type
      string        :first_name
      string        :last_name
      string        :email_address
      string        :skype_user_name
      string        :contact_groups
      string        :default_currency
      datetime_utc  :updated_date_utc, :api_name => 'UpdatedDateUTC'
      boolean       :is_supplier
      boolean       :is_customer

      has_many  :addresses, :list_complete => true
      has_many  :phones, :list_complete => true
      has_many  :contact_groups
      has_many  :contact_persons, :internal_name => :contact_people

      validates_presence_of :name
      validates_inclusion_of :contact_status, :in => CONTACT_STATUS.keys, :allow_blanks => true
      
      decimal   :box1
      decimal   :box2
      decimal   :box3
      decimal   :box4
      decimal   :box5
      decimal   :box6
      decimal   :box7
      decimal   :box8
      decimal   :box9
      decimal   :box10
      decimal   :box11
      decimal   :box13
      decimal   :box14
      string    :federal_tax_id_type
      string    :tax_id
      string    :email
      string    :city
      string    :state
      string    :zip
      string    :street_address

      def email_address?
        email_address.present?
      end

    end

  end
end
