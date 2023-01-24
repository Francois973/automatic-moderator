class ModerableModelsController < ApplicationController
  def index
    @moderable_models = ModerableModel.all
  end

  def new
    @moderable_model = ModerableModel.new
  end

  def create
    @moderable_model = ModerableModel.new(moderable_model_params)

    if @moderable_model.save
      redirect_to moderable_models_path, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def moderable_model_params
    params.require(:moderable_model).permit(:is_accepted, :content)
  end
end
