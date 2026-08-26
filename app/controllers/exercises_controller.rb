class ExercisesController < ApplicationController
  before_action :require_login, only: %i[new edit create update destroy]
  
  def index
    @exercises = Exercise.all
  end

  # FIXME
  def list
    #pass asc/desc as parameter
    exercises = Exercise.order("#{params[:column]} #{params[:direction]}")
    render(partial: 'table', locals: { exercises: exercises })
  end

  def show
    @exercise = Exercise.find params[:id]
  end

  def new
    @exercise = Exercise.new
  end

  # FIXME, reuse or remove commented code
  def edit
    @exercise = Exercise.find params[:id]
    #binding.pry
    #respond_to do |format|
    #  format.html # for regular HTTP requests
    #  format.turbo_stream do
    #    logger.info render_to_string(partial: "form", locals: { exercise: @exercise })
    #  end
    #end
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      # TODO, use status: :see_other ?
      redirect_to @exercise
    else
      render :new, status: :unprocessable_entity
    end
  end

  # FIXME, reuse or remove commented code
  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      # TODO, use status: :see_other ?
      redirect_to @exercise
    else
      render :edit, status: :unprocessable_entity
    end
    #respond_to do |format|
    #  if @exercise.update(exercise_params)
    #    format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
    #    format.turbo_stream.replace('show_exercise', template: 'exercises/show', exercise: @exercise)
    #  else
    #    format.html { render :edit }
    #  end
    #end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    if @exercise.destroy
      redirect_to exercises_path, status: :see_other
    else
      redirect_to @exercise,
      alert: "The exercise could not be deleted."
    end
  end

  # FIXME, fix / refacto
  def next_instrument
    current_instrument = Instrument.find(params[:instrument_id])
    @exercise = Exercise.find(params[:id])
    @instrument= current_instrument.next_instrument  # Assuming a method `next_question` exists on Question model

    render partial: "exercises/question", locals: { instrument: @instrument }
  end

  # FIXME, fix / refacto
  def previous_instrument
    current_instrument = Instrument.find(params[:instrument_id])
    @exercise = Exercise.find(params[:id])
    @instrument = current_instrument.previous_instrument  # Assuming a method `previous_question` exists on Question model

    render partial: "exercises/question", locals: { instrument: @instrument }
  end

  def exercise_params
    params.require(:exercise).permit(:title, :author_id)
  end

  private
    def require_login # FIXME, use authenticate_user! (from Devise) instead
      unless user_signed_in?
        flash[:alert] = 'You must be logged in to access this section'
        redirect_to new_user_session_path, status: :see_other # halts request cycle
      end
    end
end
