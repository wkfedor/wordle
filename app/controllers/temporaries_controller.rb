class TemporariesController < ApplicationController
  before_action :set_temporary, only: %i[ show edit update destroy ]

  # GET /temporaries or /temporaries.json
  def index
    @temp="1002"
    @temporaries = Temporary.all
  end

  # GET /temporaries/1 or /temporaries/1.json
  def show

    string=[]
    donts=[]
    string1='а','б'
    string2='а','б'
    string3='а','б'
    string4='а','б'
    string5='а','б'

    Temporary.find(params[:id]).dontlike.each_char do |x|
    string=string << x
    end


    Temporary.find(params[:id]).anylike.each_char do |x|
      donts=donts << x
    end
p "p===="+donts.to_s



    #donts =  Temporary.find(params[:id]).d

    @temp2=Temporary.find(params[:id]).dontlike.length
    #@temp3=donts1


    @temp=Word.ina(string).inb(string).inc(string).ind(string).ine(string)     # слова с возможным ключевым





    massnot=["sa","sb","sc","se","sd"]                                              #имена полей где не должно быть серой буквы
    massnot.each do |x|
    if Temporary.find(params[:id]).send(x) !=''                                     # доработать данный функционал, убираем из вариантов для  победы серые буквы
      @temp=@temp.send(x,(Temporary.find(params[:id]).send(x).chars))
      #@temp=@temp.send("sb",(Temporary.find(params[:id]).send(x).chars))
    end
    end


    #@temp=@temp.inc(Temporary.find(params[:id]).send(x).chars)
    # render plain: "вывести текст"



    if Temporary.find(params[:id]).a !=''                         # как можно сделать запись короче, есть массив a,b,c,d,e работаем с ним
      @temp=@temp.a(Temporary.find(params[:id]).a)
    end

    if Temporary.find(params[:id]).b !=''
      @temp=@temp.b(Temporary.find(params[:id]).b)
    end

    if Temporary.find(params[:id]).c !=''
      @temp=@temp.c(Temporary.find(params[:id]).c)
    end

    if Temporary.find(params[:id]).d !=''
      @temp=@temp.d(Temporary.find(params[:id]).d)
    end

    if Temporary.find(params[:id]).e !=''
      @temp=@temp.e(Temporary.find(params[:id]).e)
    end

    #@temp  #варианты слова для победы
    #
    #
    #
    #@temp0  слова с  неоткрытыми буквами для вскрытия поля, в идеале буквы неполвторяються с любыми открытыми


    @temp0=Word.ina(string).inb(string).inc(string).ind(string).ine(string)  # слова с исключением букв в позициях a b c d e  для открытия дргуих слов

    if Temporary.find(params[:id]).anylike !=''



    #@temp=@temp.anylike(donts)     #  старая версия

      donts.each do |x|             #  новая версия
      @temp=@temp.likea("%#{x}%")   #  новая версия
      end                           #  новая версия




# сортировка по anynum что бы на первое место попали слова без повторов букв     !!!!!!!!!!!!!!!!косяк, впереди слова с буквами которые есть,Раскрыть поле без повторов и Раскрыть поле с повторами сделать
    @temp0=@temp0.ina(donts).inb(donts).inc(donts).ind(donts).ine(donts).order('anynum, lettersumweight DESC')
    end


  end

  # GET /temporaries/new
  def new
    @temporary = Temporary.new
  end

  # GET /temporaries/1/edit
  def edit
  end

  # POST /temporaries or /temporaries.json
  def create
    @temporary = Temporary.new(temporary_params)
    @temp="1000"
    respond_to do |format|
      if @temporary.save
        format.html { redirect_to temporary_url(@temporary), notice: "Temporary was successfully created." }
        format.json { render :show, status: :created, location: @temporary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temporary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temporaries/1 or /temporaries/1.json
  def update
    respond_to do |format|
      if @temporary.update(temporary_params)
        format.html { redirect_to temporary_url(@temporary), notice: "Temporary was successfully updated." }
        format.json { render :show, status: :ok, location: @temporary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temporary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temporaries/1 or /temporaries/1.json
  def destroy
    @temporary.destroy

    respond_to do |format|
      format.html { redirect_to temporaries_url, notice: "Temporary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temporary
      @temporary = Temporary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def temporary_params
      params.require(:temporary).permit(:anylike, :dontlike, :a, :b, :c, :d, :e, :sa, :sb, :sc, :sd, :se)
    end
end
