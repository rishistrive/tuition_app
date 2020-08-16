class CoursesController < ApplicationController
  load_and_authorize_resource

  before_action :set_course, only: %i[show edit update destroy approve join_request]

  def index
    @courses = Course.approved
  end

  def unapproved
    @courses = Course.unapproved
  end

  def approve
    respond_to do |format|
      if @course.update(approve: true)
        format.html { redirect_to @course, notice: 'Course was successfully approved.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def filters
    @courses = Course.approved
    @courses = @courses.send(params[:course_filter]) if Course::FILTERS.include?(params[:course_filter])
    respond_to do |format|
      format.js
      format.html { render 'index' }
    end
  end

  def show; end

  def new
    @course = Course.new
  end

  def edit; end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
    end

  def course_params
    params.require(:course).permit(:information, :title, :content, :start_datetime, :end_datetime, :students_length, :teacher_id)
  end
end
