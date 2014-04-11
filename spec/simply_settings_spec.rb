require 'spec_helper'

describe SimplySettings do

  subject(:settings) { SimplySettings::Settings.instance }

  context 'Getting and Setting values' do
  
    it "defines getter and setter for any setter" do
      settings.hello = "world"
      expect(settings.hello).to eql("world")
    end

    it "returns nil for unknown getters" do
      expect(settings.hello).to be_nil
    end

    it "reassigns value" do
      settings.hello = "world"
      settings.hello = "hello"
      expect(settings.hello).to eql("hello")
    end

  end

  context "Deleting a setting" do

    it "deletes an explicit method name" do
      settings.hello = "world"
      settings.delete(:hello)
      expect(settings.exists?(:hello)).to be_false
    end

    it "deletes a setting when assigned to nil" do
      settings.hello = "world"
      settings.hello = nil
      expect(settings.exists?(:hello)).to be_false
    end

  end

  context "Fetching settings like a Hash" do

    pending "returns value if defined" do

    end

    pending "defines and returns default value if undefined" do

    end
  end

  context "Bracket access to settings like a Hash" do

    pending "sets a value with []=" do

    end

    pending "gets a value with [:setting_name]" do

    end

  end

  context "Listing settings" do

    pending "lists defined settings in ascending alpha order" do

    end

  end

  context "Setting / Retrieving objects" do
    pending "assigns boolean and gets boolean" do

    end

    pending "assigns array and gets array" do

    end

    pending "assigns hash and gets hash" do

    end

    pending "creates getters with question marks for boolean values" do

    end
  end

end