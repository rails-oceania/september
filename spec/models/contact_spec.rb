require 'spec_helper'

describe Contact do
  describe '#valid?' do
    it "accepts valid email addresses" do
      contact = Contact.new :email => 'pat@ruby.com'
      expect(contact).to have(0).errors_on(:email)
    end

    it "does not like emails with spaces" do
      contact = Contact.new :email => 'pat @ruby.com'
      expect(contact).to have(1).errors_on(:email)
    end

    it "does not like emails with no TLD" do
      contact = Contact.new :email => 'pat@ruby'
      expect(contact).to have(1).errors_on(:email)
    end
  end
end
