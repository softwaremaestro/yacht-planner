class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #@post = Post.find(params[:id])

    @post = []
    tmp = {}
    tmp["image_url"]="https://encrypted-tbn0.google.com/images?q=tbn:ANd9GcRhpTOye5bnCu4L6I9tyx89jyIWBSCvb23dCHYvinHR2_3nPULfsw"
    tmp["name"]="first"
    tmp["content"]="asdadadd sadjsl akdjkasldsdl;jldasdljdlsmdnmas,nas si soduwq qw wle jlq qwj q; qwejl;;"

    @post.push tmp

    tmp = {}
    tmp["image_url"]="http://c2thumb.cyworld.com/thumb_160x245/http://c2down.cyworld.co.kr/download?fid=6422369cb0938ea2a3a43841796ca3ee&name=mamas.jpg"
    tmp["name"]="haha"
    tmp["content"]="hoho"
    @post.push tmp

    render json: @post

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @post }
    #end

  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
