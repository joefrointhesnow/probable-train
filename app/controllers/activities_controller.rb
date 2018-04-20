#this is the activites controller
class ActivitiesController < ApplicationController

  def activities_params
    params.require(:activity).permit(:title, :duration, :startTime, :description, :activeCode)
  end

  def show
    #@work = Work.find(params[:id])
    #id = params[:id] # retrieve activities ID from URI route
    #@activity = Activity.find(id) # look up activities by unique ID
    # will render app/views/activities/show.<extension> by default
    
    @activity = Activity.find(params[:id]) # look up activities by unique ID
    if (params[:textinput] != nil)
     @activity.update(:activeCode => params[:textinput]) #updates activeCode with the 'save button'
    end
   
    
  end

  def index
   # @activities = Activity.all
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @prng = Random.new
    @activities_params_copy = activities_params.merge(:activeCode => @prng.rand(1000000))
    if (activities_params[:title] == "")
      flash[:notice] = "Activity could not be created."
      redirect_to('/activities/select_activity') and return
    else
      @activity = Activity.create!(@activities_params_copy)
      flash[:notice] = "#{@activity.title} was successfully created."
      redirect_to("/activities/" + @activity.id.to_s) and return
    end
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def update
   @prng = Random.new
   @activities_params_copy = activities_params.merge(:activeCode => @prng.rand(1000000))
   @activity = Activity.find params[:id]
   @activity.update(activities_params)
   flash[:notice] = "#{@activity.title} was successfully created."
   redirect_to "/activities/" + @activity.id.to_s
  end
  
  def generatecode
   @prng = Random.new
   @newCode = @prng.rand(1000000)
   @activity = Activity.find params[:activity_id]
   @activity.update(:activeCode => @newCode)
   flash[:notice] = "A new code for #{@activity.title} was successfully generated."
   redirect_to "/activities/" + @activity.id.to_s
  end
  
  def destroy
    @activities = Activity.find(params[:id])
    @activities.destroy
    flash[:notice] = "Activity '#{@activities.title}' deleted."
    #redirect_to activities_path
    redirect_to "/activities/select_activity"
  end
  
  #added this to display select activity page since it had no controller connected to it
  #I just copied the html file to the Backup folder under root of the workspaceand 
  #now works if you add /activities/select_activity to url
  def select_activity
    @activities = Activity.all
  end
  
  def earning_student
    #get current user
    #current user gets parsed by some regex in the corresponing view
    #im not sure what I would write as a test for this literal single line of code
    @current_user_data = current_user
    #@bool = @current_user_data.respond_to?(:to_s)
  end
  
  def cash_out
  end

end
