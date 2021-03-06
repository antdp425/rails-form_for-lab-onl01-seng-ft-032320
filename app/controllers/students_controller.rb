class StudentsController < ApplicationController

   def new
      @student = Student.new
    end

    def create
      @student = Student.create(student_params(:first_name, :last_name))
      @student.save
      redirect_to @student 
    end

    def show
      @student = Student.find_by(id: params[:id])
    end

    def edit
      @student = Student.find_by(id: params[:id])
    end

    def update
      @student = Student.update(student_params(:first_name, :last_name))
      redirect_to @student 
    end

  private 
    def student_params(*args)
      params.require(:student).permit(*args)
    end
end
