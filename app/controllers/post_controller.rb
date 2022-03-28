class PostController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'open_uri_redirections'

    def index


      mass = workurl
      temp = ''
      mass.each do |i|
        html = open(i.to_s) #html = open(i.to_s, :allow_redirections => :all)  #было так, непонятно почему
        html = Nokogiri::HTML html
        html.css('.list-group-item').each do |j|
          #@temp <<
          temp=(j.text).split(" ")[1]
          @word=Word.new("word"=>temp, "anynum"=>(anynum(temp))  , "codeword"=>"", "a"=>temp[0], "b"=>temp[1], "c"=>temp[2], "d"=>temp[3], "e"=>temp[4])
          @word.save


        end
      end
    end

    def anynum(a)
      hash = {}

temp=0

      a.each_char do |b|

      if a.count(b)==2
        temp=temp+1
      end

      if a.count(b)==3
        temp=temp+1
      end


      if a.count(b)==4
        temp=temp+1
      end

      end

      #Rails.logger.debug('-------------------------')
      #Rails.logger.debug(a+'------'+temp.to_s)
      #Rails.logger.debug('-------------------------')

      temp
    end






  def  workurl    #массив страниц с словами для парсинга
    ["https://slovogriz.ru/pomoshnik-krossfordista/%D0%B0%7E%7E%7E%7E",
     "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B1%7E%7E%7E%7E"]
  end



  def  workurl2    #массив страниц с словами для парсинга
        ["https://slovogriz.ru/pomoshnik-krossfordista/%D0%B0%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B1%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B2%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B3%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B4%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B5%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B6%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B7%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B8%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%BA%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%BB%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%BC%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%BD%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%BE%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%BF%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%80%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%81%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%82%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%83%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D0%A4%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%85%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%86%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%87%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%88%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%89%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%8D%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%8E%7E%7E%7E%7E",
        "https://slovogriz.ru/pomoshnik-krossfordista/%D1%8F%7E%7E%7E%7E"]
  end




end
