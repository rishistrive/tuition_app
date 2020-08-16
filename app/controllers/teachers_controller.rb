class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show edit update destroy received_course_requests]

  def index
    @teachers = Teacher.all
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teacher_path(@teacher), notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def received_course_requests
    @received_course_requests = CourseJoinRequest.where(course: @teacher.courses, approve: false)
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email)
  end
end
