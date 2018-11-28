class PeopleController < ApplicationController

  before_action :set_person, only: [:show, :update, :edit, :destroy]
  
  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
    render partial: "form"
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @person.update(person_params)
      redirect_to @person
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to root_path
  end


  private
    def person_params
      params.require(:person).permit[:name]
    end

    def set_person
      @person = Person.find(params[:id])
    end
end
