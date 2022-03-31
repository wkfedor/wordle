class PostController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'open_uri_redirections'

    def del
      Word.delete_all
      redirect_to "/words"
    end



  def comb            #работа с сотавлением цепочки слов
    #Answer.order_by_rand.limit(1).all

    #@first='адрес'
    @first=Word.order("RANDOM()").first.word
    a = Array.new

    @first.each_char do |b|   # как красиво сделать из строчки массив ?
      a <<  b
    end

    @second=perebor(a)


    @second.each_char do |b|   # как красиво сделать из строчки массив ?
      a <<  b
    end


    @third=perebor(a)


    @third.each_char do |b|   # как красиво сделать из строчки массив ?
      a <<  b
    end

    @fourth=perebor(a)


    @fourth.empty? == false ?  @fourth.each_char{|b|    a <<  b} : return

    #do |b|   # как красиво сделать из строчки массив ?
    #   a <<  b
    #end


    @fifth=perebor(a)

    sleep(1)

    @fifth.empty? == true  ? myredirect : return

  end

  def myredirect

    redirect_to "/post/comb"

  end


def perebor(mass) #

temp=''
  mass.each do |b|     # переделай под { ...   }
    temp=temp+','+"'"+b+"'"
  end

if temp[0]==','     # переделей под тернарный оператор
  temp.slice!(0)
end

temp2=Word.where('words.a not in ('+temp+') and  words.b not in ('+temp+') and  words.c not in ('+temp+') and  words.d not in ('+temp+') and  words.e not in ('+temp+') and words.anynum=0').limit(1)

temp2.each do |rank|
return  rank.word
end

end





  def index
      mass = workurl
      temp = ''
      mass.each do |i|

        Rails.logger.debug('-------------------------')
        Rails.logger.debug(i.to_s)
        Rails.logger.debug('-------------------------')

        html = open(i.to_s) #html = open(i.to_s, :allow_redirections => :all)  #было так, непонятно почему
        html = Nokogiri::HTML html
        html.css('.list-group-item').each do |j|

          temp=(j.text).split(" ")[1]


            next  if temp.index("-")


          @word=Word.new("word"=>temp, "anynum"=>(anynum(temp))  , "codeword"=> simple_numbers(temp), "a"=>temp[0], "b"=>temp[1], "c"=>temp[2], "d"=>temp[3], "e"=>temp[4])
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

      if a.count(b)==5
        temp=temp+1
      end

      end

      #Rails.logger.debug('-------------------------')
      #Rails.logger.debug(a+'------'+temp.to_s)
      #Rails.logger.debug('-------------------------')

      temp
    end






  def  workurl2    #массив страниц с словами для парсинга
    ["https://slovogriz.ru/pomoshnik-krossfordista/%D0%B0%7E%7E%7E%7E",
     "https://slovogriz.ru/pomoshnik-krossfordista/%D0%B1%7E%7E%7E%7E"]
  end



  def  workurl    #массив страниц с словами для парсинга
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




 def simple_numbers(a)
temp=1

hash=simple_data


    a.each_char do |b|
      temp=temp * hash[b]

      Rails.logger.debug('-------------------------')
      Rails.logger.debug(a+'------'+b+'------'+temp.to_s)
      Rails.logger.debug('-------------------------')



    end
   return temp
 end

def simple_data
  hash={"а"=>3,	"б"=>5,	"в"=>7,	"г"=>11,	"д"=>13,	"е"=>17,	"ё"=>19,	"ж"=>23,	"з"=>29,
        "и"=>31,	"й"=>37,	"к"=>41,	"л"=>43,	"м"=>47,	"н"=>53,	"о"=>59,	"п"=>61,	"р"=>67,	"с"=>71,
        "т"=>73,	"у"=>79,	"ф"=>83,	"х"=>89,	"ц"=>97,	"ч"=>101,"ш"=>103,"щ"=>107,"ъ"=>109,"ы"=>113,
        "ь"=>127,"э"=>131,"ю"=>137,"я"=>139}
end



end
