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
    temp=true


     while temp do


       #@first='адрес'
    #@first=Word.order("RANDOM()").sample.word

    @first=Word.where("anynum = 0 and a in ('о','е','а','и','н','т','с','р','в','л','к') and b in ('о','е','а','и','н','т','с','р','в','л','к') and c in ('о','е','а','и','н','т','с','р','в','л','к') and d in ('о','е','а','и','н','т','с','р','в','л','к') and e in ('о','е','а','и','н','т','с','р','в','л','к')").order("RANDOM()").sample.word

    Rails.logger.debug('-------------------------')
    Rails.logger.debug("first="+@first.to_s)
    Rails.logger.debug('-------------------------')

    a = []#Array.new

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


    if @fourth.empty? == false
      @fourth.each_char{|b|    a <<  b}
      temp=false
    else
    '' #  redo
    end
=begin
    #do |b|   # как красиво сделать из строчки массив ?
    #   a <<  b
    #end

    Rails.logger.debug('-------------------------')
    Rails.logger.debug("четвертое слово="+@fourth.to_s)
    Rails.logger.debug('-------------------------')


    @fifth=perebor(a)



    if @fifth.empty? == true
        temp=true
    else
    temp=false
    end


    Rails.logger.debug('-------------------------')
    Rails.logger.debug("fifth="+@fifth.to_s)
    Rails.logger.debug('-------------------------')
=end

     end


  end

  def myredirect

    redirect_to "/post/comb"

  end

def lettersumweight
  mas={}
 alphabet.each do |x|  # перебираем все буквы и собираем статистику по нашей базе
   temp=0
   ['a','b','c','d','e'].each do |y|
     temp=temp+Word.countletter(y,x)
   end
   mas[x]=temp
   temp=0
 end
 render plain: mas.inspect
end

#   render plain: Word.countletter("a",x).inspect
#   return



  def iskl

    "and words.word not in ('вдруг','кишмя','южный','бурый','взвив') and words.a!='ё' and words.b!='ё' and words.c!='ё' and words.d!='ё' and words.e!='ё'"
  end


def perebor(mass) #

temp=''
  mass.each do |b|     # переделай под { ...   }
    temp=temp+','+"'"+b+"'"
  end

if temp[0]==','     # переделей под тернарный оператор
  temp.slice!(0)
end

temp2=Word.where('words.a not in ('+temp+') and  words.b not in ('+temp+') and  words.c not in ('+temp+') and  words.d not in ('+temp+') and  words.e not in ('+temp+') and words.anynum=0 ' + iskl ).order("RANDOM()").limit(1)

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


 def alphabet
   ["а","б","в","г","д","е","ё","ж","з","и","й","к","л","м","н","о","п","р","с","т","у","ф","х","ц","ч","ш","щ","ъ","ы","ь","э","ю","я"]
 end



end
