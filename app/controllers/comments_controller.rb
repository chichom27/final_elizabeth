class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  
  access_control do
     allow :admin     
     allow all, :to => [:index, :show, :create]
     allow :review, :to =>[:edit, :destroy]
     allow :owner, :of => :comment, :to => :destroy
  end
  
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        #current_user.has_role!('owner', @comment)
        flash[:notice] = 'Comment was successfully created.'
        if @comment.event == nil
          format.html { redirect_to(@comment.photo) }
        else
          format.html { redirect_to(@comment.event) }
        end
        format.xml  { render :xml => @comment.event, :status => :created, :location => @comment.event }
      else
        if @comment.event == nil
          format.html { redirect_to(@comment.photo) }
        else
          format.html { redirect_to(@comment.event) }
        end
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@comment.event) }
      format.xml  { head :ok }
    end
  end
end
