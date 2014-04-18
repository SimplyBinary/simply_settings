require 'spec_helper'

describe SimplySettings do
  subject(:settings) { SimplySettings }

  context "Fetching settings like a Hash" do

    it "returns value if defined" do
      settings.hello = "world"
      expect(settings.fetch(:hello)).to eql("world")
    end

    it "assigns the default value if the setting is not found" do
      settings.fetch(:hello) { "world" }
      expect(settings.hello).to eql("world")
    end
  end

  context "Bracket access to settings like a Hash" do

    it "sets a value with []=" do
      settings[:hello] = "world"
      expect(settings.hello).to eql("world")
    end

    it "gets a value with [:setting_name]" do
      settings.hello = "world"
      expect(settings[:hello]).to eql("world")
    end

  end
end