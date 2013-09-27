require 'spec_helper'

describe ContactsController do
  describe '#create' do
    let(:action) { post :create, :contact => {:first_name => 'Pat'} }
    let(:contact) { double 'Contact', :save => true, :first_name => 'Pat',
      :last_name => 'Allan' }

    before :each do
      stub_const 'Contact', double(:new => contact)
    end

    it "builds a new contact" do
      Contact.should_receive(:new).with('first_name' => 'Pat').
        and_return(contact)

      action
    end

    it "saves the contact" do
      contact.should_receive(:save)

      action
    end

    context 'with valid details' do
      before :each do
        contact.stub :save => true
      end

      it "redirect to the home page" do
        action

        response.should redirect_to(root_path)
      end

      it "sets the flash message" do
        action

        flash[:notice].should == "Saved contact Pat Allan"
      end
    end

    context 'with invalid details' do
      before :each do
        contact.stub :save => false
      end

      it "renders the new action again" do
        action

        response.should render_template('new')
      end
    end
  end
end
