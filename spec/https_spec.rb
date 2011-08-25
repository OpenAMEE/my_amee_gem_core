require File.dirname(__FILE__) + '/spec_helper.rb'
require 'my_amee/https'

describe Net::HTTP do

  it "should be able to get SSL with a one-liner" do
    uri = URI.parse("https://encrypted.google.com/search?q=fizzgig")
    r = Net::HTTP.get_with_https(uri)
    r.body.include?('fizzgig').should be_true
  end

  it "should still support non-SSL connections" do
    uri = URI.parse("http://www.google.com/search?q=fizzgig")
    r = Net::HTTP.get_with_https(uri)
    r.body.include?('fizzgig').should be_true
  end

  it "should work without query parameters" do
    uri = URI.parse("https://encrypted.google.com/webhp")
    r = Net::HTTP.get_with_https(uri)
    r.body.include?('Google').should be_true
  end

end