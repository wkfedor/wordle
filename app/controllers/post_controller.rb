class PostController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'open_uri_redirections'

  def index


    url = 'https://slovogriz.ru/pomoshnik-krossfordista/%D0%B2~~~~'

    html = open(url, :allow_redirections => :all)

    html = Nokogiri::HTML html
    @temp=''
    html.css('.list-group-item').each do |i|
      @temp=@temp+i.text
    end


  end


end
