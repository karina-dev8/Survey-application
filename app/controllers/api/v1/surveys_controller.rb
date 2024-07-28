module Api
  module V1
    class SurveysController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @surveys = Survey.all
      end

      def create
        @survey = Survey.new(survey_params)
        if @survey.save
          render json: @survey, status: :OK
        else
          render json: @survey.errors, status: :unprocessable_entity
        end
      end

      def show
        @survey = Survey.find_by(id: params[:id])
      end

      def update
        @survey = Survey.find_by(id: params[:id])
        if @survey.update(survey_params)
          render json: @survey
        else
          render json: @survey.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @survey = Survey.find(params[:id])
        if @survey.destroy
          render plain: "Survey is deleted successfully", status: :ok
        else
          render json: { error: "Failed to delete survey" }, status: :unprocessable_entity
        end
      end

      def survey_params
        params.require(:survey).permit(:name, :description)
      end
    end
  end

end
