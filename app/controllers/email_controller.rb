class EmailController < ApplicationController

  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(
      object: Faker::Cannabis.health_benefit,
      body: Faker::Lorem.paragraph(6),
   )
    if @email.save
      flash[:notice] = "Email created"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

end
