class EmailController < ApplicationController

  def index
    @emails = Email.all
  end

  def show 
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { 
        flash[:notice] = "Email created"
        redirect_to root_path
      }
      format.js { }
    end
  end

  def create
    @email = Email.new(
      object: Faker::Cannabis.health_benefit,
      body: Faker::Lorem.paragraph(6),
   )
    if @email.save
      respond_to do |format|
        format.html { 
          flash[:notice] = "Email created"
          redirect_to root_path
        }
        format.js { }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { 
        flash[:notice] = "Email destroyed"
        redirect_to root_path
      }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.read = true
    respond_to do |format|
      format.html { 
        flash[:notice] = "Email updated"
        redirect_to root_path
      }
      format.js { }
    end
  end

end
