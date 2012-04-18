require 'builder'
class LevelsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :except => [:create]
  
  def new
    @title = "new"
    render 'test'
  end
  
  def create
    @temp = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
    @temp = params.clone        #making new hash and removing unwanted tags
    binding.pry
      
=begin  
    i = 0
    tobedeleted = ["commit", "controller", "authenticity_token", "utf8", "action"]
    @temp.each do |key, value|
      if value == 
      delete(tobedeleted[i] )
      i = 1 +1 
    end
=end
      
    @temp.delete("commit")
    @temp.delete("controller")
    @temp.delete("authenticity_token")
    @temp.delete("utf8")
    @temp.delete("action")    
    binding.pry


    if @temp["question_type"] == "normal"
      @questionStringtemp = @temp["questions"]
      @questionStringtemp1 = @questionStringtemp.split(",")   # [ "1", "1/2"."3/5"]
      #@temp["questions"]["question"] = @questionStringtemp
      @temp.delete("startPoint")
      @temp.delete("endPoint")
      @temp.delete("flagPoint")
      @temp.delete("answer")
      binding.pry
      h1 = {"question" => @questionStringtemp1}	
      @temp["questions"] = h1
      #insert value of text box in the hash , using Dictionary value , and delete the measurement field(if any )
      #also see for start point , end point , flag point , end
      binding.pry
    else
      @temp.delete("questions")  #assuming questions not there in measurement
      
      #for measurement case
    end
    binding.pry

    if @temp["question_sequence"] == "rbbkt"
      @temp["question_sequence"]["kcs"]["kc"] = params["question_sequence"]["textkc"]
      @temp["question_sequence"]["textkc"]
      @temp.delete("textbinsize")
      binding.pry
      
      #insert value from text boxes.. , in hash , and remove the "rbtree" from hash
    else
      if @temp["question_sequence"] == "rbdtree"
        #insert value from binsize text box , and remove the "rbbkt" key from hash
        @temp.delete("") #have to delte something like question_sequence.rbbkt
        binding.pry
        
      end #end of else for rbdtree
      
    end
    binding.pry

    @str = @temp.to_xml(:skip_instruct =>true, :skip_types => true, :root => 'level') 
    @varun ={ :levelcreator => params[:creatorname], :levelname => params[:levelname], :xml => @str}
    if @lc = Level.create(@varun)
      render 'index'
    else
      render 'test'
    end
    binding.pry
    
    #render 'main'
 end
 def show   
  @lc = Level.find(:all)
  render 'levelloader'
 end
 
 def update
   if params[:level][:levelcreator] == nil
     @title = "Nikhil"
     render 'main'
     return
   else
     @temp = params[:level][:levelcreator]
     @temp1 =  Level.find_by_levelcreator(@temp)
     @temp2 = @temp1[:xml]  
     @temp3 = Hash.from_xml(@temp2)

     @creatorname = @temp3["level"]["creatorname"]       #as hash have another hash into it i.e hash =>{ "creatorname" => "kishan", "levelname" => "vyas"}
     @startpoint  = @temp3["level"]["startPoint"]
     @timelimit   = @temp3["level"]["timeLimit"]
     @leveltitle       = @temp3["level"]["title"]
     @numberoftrail=@temp3["level"]["number_of_trial"]
     @instructionSequence = @temp3["level"]["instruction-sequence"]
    
     @modetemp = @temp3["level"]["mode"]
     case @modetemp
     when "Type"
       @mode2 = true 
     when "Click"
       @mode1 = true
     when "Mix!"
       @mode3 = true
     when "Random"
       @mode4 = true
     end

      @typetemp = @temp3["level"]["type"]
      case @typetemp
      when "At_Midpoint"
        @type1 = true 
      when "at 0"
        @type2 = true
      when "at 1/4s"
        @type3 = true
      when "at 10s"
        @type4 = true
      when "at Whole Number"
        @type5 = true
      end
      
      @IStemp = @temp3["level"]["instruction_sequence"]
      case @IStemp
      when "As in instruction Set"
        @instructionSequence1 = true 
      when "Randomize once"
        @instructionSequence2 = true
      when "Randomize every trial"
        @instructionSequence3 = true
      when "ITS"
        @instructionSequence4 = true
      end
     
     #@type        = @temp3["level"]["type"]
     @levelname   = @temp1[:levelname]      #@temp1 contains value of :levelname 
     render 'test'
   end
 end
 
 def levelloader
   @lc = Level.find(:all)
 end

 def index
   @title = "Index" 
 end
 def edit
   @title = "EDIT "
 end
 

end    #end of controller class 
