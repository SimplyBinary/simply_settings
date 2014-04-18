require 'spec_helper'

describe SimplySettings do

  subject(:settings) { SimplySettings }

  context "Caching settings" do

    let(:cached_setting) do 
      -> { SimplySettings.cache.read("simply_settings_hello") }
    end

    it "sets cache the first time it is retrieved" do
      settings.hello = "world"
      settings.hello
      expect(cached_setting.call.value).to eql("world")
    end

    it "invalidates the cache when the value changes" do
      settings.hello = "world"
      settings.hello = "hello"
      settings.hello
      expect(cached_setting.call.value).to eql("hello")
    end

    it "invalidates the cache when deleted" do
      settings.hello = "world"
      settings.hello
      settings.delete(:hello)
      expect(cached_setting.call).to be_nil
    end

  end
end