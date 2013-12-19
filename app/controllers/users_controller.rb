class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  
	def home
           session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL)
           begin
            
	    @auth_url = session[:oauth].url_for_oauth_code(:permissions=>"read_stream")         
                           
            session[:signed_request] = session[:oauth].parse_signed_request(params[:signed_request])
            @a = session[:signed_request]['page']['liked']
            
            if @a==true
             @b = session[:signed_request]['user_id']
             @c = session[:oauth].get_user_info_from_cookies(cookies)
             redirect_to :new_user
	    end

          rescue Exception=>ex
	   puts ex.message
          end
		
         respond_to do |format|
         format.html { }
         end

       end

	   


 def index
    @users = User.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
     @user = User.new
     @se = session[:oauth]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save_with_captcha
        format.html { redirect_to :thankyou, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  def thankyou
  end
end
