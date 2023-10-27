require './lib/myextractor'
require 'nokogiri'
require 'net/https'

RSpec.describe Myextractor do
  subject { described_class.new(req, doc) }
  let(:req) { Net::HTTP.new('example.com', 443) }
  let(:response) do
    req.use_ssl = true
    req.get("/")
  end
  let(:doc) { Nokogiri::HTML(response.body) }

  describe "get content of tag 'p'" do
    let(:challenge) { doc.at('p') }

    it do
      expect(subject.get_element).to eq(challenge.content)
    end
  end
end