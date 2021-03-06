require 'spec_helper'

describe SimplySettings do

  subject(:settings) { SimplySettings }

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

  context "Listing settings" do

    it "lists defined settings in ascending alpha order" do
      settings.b = "1"
      settings.c = "2"
      settings.a = "3"
      expect(settings.settings).to eql(["a", "b", "c"])
    end

  end

  context "Defining setting methods" do

    it "defines getters and setters when set." do
      settings.hello = "world"
      expect(settings.respond_to?(:hello)).to eql(true)
      expect(settings.respond_to?(:hello=)).to eql(true)
    end

    it "removes getters and setters when deleted" do
      settings.hello = "world"
      settings.delete(:hello)
      expect(settings.respond_to?(:hello)).to be_false
    end

    it "removes getters and setters when assigned to nil" do
      settings.hello = "world"
      settings.hello = nil
      expect(settings.respond_to?(:hello)).to be_false
    end

  end

  context "Setting / Retrieving objects" do
    it "assigns boolean and gets boolean" do
      settings.is_true = true
      expect(settings.is_true).to eql(true)
    end

    it "assigns array and gets array" do
      settings.is_array = [1,2,3]
      expect(settings.is_array).to eql([1,2,3])
    end

    it "assigns hash and gets HashWithIndifferentAccess" do
      settings.is_hash = { hello: "world"}
      expect(settings.is_hash[:hello]).to eql("world") 
    end

    it "creates getters with question marks for boolean values" do
      settings.is_true = true
      expect(settings.is_true?).to eql(true)
    end
  end
end