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
      object: Faker::Cannabis.health_benefit.capitalize,
      body: Faker::Lorem.paragraph(88),
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
    @email.read = false
    @email.save
    respond_to do |format|
      format.html { 
        flash[:notice] = "Email no-read"
        redirect_to root_path
      }
      format.js { }
    end
  end

  def destroy_all
    @emails = Email.all
    @emails.each do |email|
      email.destroy
    end
    respond_to do |format|
      format.html { 
        flash[:notice] = "All emails destroyed"
        redirect_to root_path
      }
      format.js { }
    end
  end

end
