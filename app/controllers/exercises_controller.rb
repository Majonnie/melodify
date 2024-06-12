class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

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

  def edit
    @exercise = Exercise.find params[:id]
    respond_to do |format|
      format.html # for regular HTTP requests
      format.turbo_stream do
        logger.info render_to_string(partial: "form", locals: { exercise: @exercise })
      end
    end
  end

  def update
    @exercise = Exercise.find(params[:id])
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.turbo_stream.replace('show_exercise', template: 'exercises/show', exercise: @exercise)
      else
        format.html { render :edit }
      end
    end
  end

  # TODO - Fix/Refacto
  def next_instrument
    current_instrument = Instrument.find(params[:instrument_id])
    @exercise = Exercise.find(params[:id])
    @instrument= current_instrument.next_instrument  # Assuming a method `next_question` exists on Question model

    render partial: "exercises/question", locals: { instrument: @instrument }
  end

  def previous_instrument
    current_instrument = Instrument.find(params[:instrument_id])
    @exercise = Exercise.find(params[:id])
    @instrument = current_instrument.previous_instrument  # Assuming a method `previous_question` exists on Question model

    render partial: "exercises/question", locals: { instrument: @instrument }
  end

  def exercise_params
    params.require(:exercise).permit(:title, :email, :password, :password_confirmation)
  end
end
