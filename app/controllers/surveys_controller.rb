class SurveysController < ApplicationController
  def index
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to edit_survey_path(@survey), notice: 'Survey was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      redirect_to edit_survey_path(@survey), notice: 'Survey was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end


  private

  def survey_params
    params.require(:survey).permit(:name, :description)
  end
end
