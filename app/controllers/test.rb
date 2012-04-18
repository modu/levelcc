require 'builder'
class LevelsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :except => [:create]
  
  def new
    @title = "new"
    debugger
    render 'test'
  end
  
  def create
    @temp = params.clone        #making new hash and removing unwanted tags

=begin  
    i = 0
    tobedeleted = ["commit", "controller", "authenticity_token", "utf8", "action"]
    @temp.each do |key, value|
      key.delete(tobedeleted[i] )
      i = 1 +1 
    end
=end      
    
    @temp.delete("commit")
    @temp.delete("controller")
    @temp.delete("authenticity_token")
    @temp.delete("utf8")
    @temp.delete("action")    
    
    @str = @temp.to_xml(:skip_instruct =>true, :skip_types => true, :root => 'level') 
    @varun ={ :levelcreator => params[:creatorname], :levelname => params[:levelname], :xml => @str}
    if @lc = Level.create(@varun)
      render 'index'
    else
      render 'new'
    end
    
    #render 'main'
 end
 def show   
  @lc = Level.find(:all)
  render 'levelloader'
 end
 
 def update
   debugger
   if params["level"]["levelcreator"] == nil
     @title = "Nikhil"
     render 'main'
     return
   else
     @temp = params["level"]["levelcreator"]
     @temp1 =  Level.find_by_levelcreator(@temp)
     @temp2 = @temp1[:xml]  
     @temp3 = Hash.from_xml(@temp2)
     @creatorname = @temp3["level"]["creatorname"]       #as hash have another hash into it i.e hash =>{ "creatorname" => "kishan", "levelname" => "vyas"}
     @startpoint  = @temp3["level"]["startPoint"]
     @timelimit   = @temp3["level"]["timeLimit"]
     @title       = @temp3["level"]["title"]
     @numberoftitle=@temp3["level"]["number_of_trial"]
     @modetemp = @temp["level"]["mode"]
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
     
     @typetemp = @temp["level"]["type"]
     case @modetemp
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
     
     
     
     #@type        = @temp3["level"]["type"]
     @levelname   = @temp1[:levelname]      #@temp1 contains value of :levelname 
     #render 'main'
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