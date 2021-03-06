class OrganizationsController < ApplicationController
  # GET /organizations
  # GET /organizations.xml
  layout 'orgshow_layout'
  include AuthenticatedSystem
  access_control do
     allow :admin
     allow :org, :to => [:destroy,:new,:create]
     allow all, :to => [:index, :show]
     allow :owner, :of => :organization, :to => [:destroy, :edit , :update]
  end
  
  def index
    @organizations = Organization.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.xml
  def show
    @organization = Organization.find(params[:id])
    @events = Event.find(:all, :conditions =>  ["org_id = ? and is_active = ?", @organization.id, true])
    @album = Album.find_by_id(@organization.album_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organization }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.xml
  def new
    @organization = Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.xml
  def create
    @organization = Organization.new(params[:organization])
    
    
    respond_to do |format|
      if @organization.save
        User.updateOrg(current_user.id,@organization.id)
        
        @album = Album.new
        @album.name = @organization.name
        @album.save
        @organization.album_id = @album.id
        Organization.updateAlbum(@organization.id,@album.id)
        
        current_user.has_role!('owner', @organization)
        flash[:notice] = 'Organization was successfully created.'
        format.html { redirect_to(@organization) }
        format.xml  { render :xml => @organization, :status => :created, :location => @organization }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.xml
  def update
    @organization = Organization.find(params[:id])

    if current_user.has_role?('admin')
      @organization.is_pending = false
    end
    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        flash[:notice] = 'Organization was successfully updated.'
        format.html { redirect_to(@organization) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  # DELETE /organizations/1
  # DELETE /organizations/1.xml
  def destroy
    @organization = Organization.find(params[:id])
    
    if current_user.has_role?('org')
      @organization.is_active = false
      @organization.save!
    else
      @organization.destroy
      @events = Event.find(:all, :conditions =>  ["org_id = ?", @organization.id], :order => "created_at")
      
      for event in @events
        event.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to(organizations_url) }
      format.xml  { head :ok }
    end
  end
end
