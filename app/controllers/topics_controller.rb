class TopicsController < ApplicationController
  #To prevent bot spam:
  invisible_captcha only: [:create, :update], honeypot: :subtitle


  #This code is necessary for pagination.

  #If this value is changed at ALL, go into 'topics/index.html.erb' and change
  #the values for @topics.count because they are hard coded.
  TOPICS_PER_PAGE = 8

  def index
    @page = params.fetch(:page, 0).to_i
    @topics = Topic.offset(@page * TOPICS_PER_PAGE).limit(TOPICS_PER_PAGE)
  end
  #End of pagination code.

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to @topic
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: "The topic has been generated."}
        format.json { render :show, status: :created, location: @topic }

      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
  def topic_params
    params.require(:topic).permit(:title, :body, :username)
  end

end
