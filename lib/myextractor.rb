require 'net/http'
require 'nokogiri'
class Myextractor
  attr_accessor :req, :doc  
  def initialize(req, doc)
    @req = req
    @doc = doc
  end

  def get_element
    req.use_ssl = true
    chalenge = @doc.at('p')
    chalenge.content
  end
end
