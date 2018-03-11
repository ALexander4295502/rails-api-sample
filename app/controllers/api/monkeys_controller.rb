class Api::MonkeysController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    render json: Monkey.all
  end

  def show
    list = Monkey.find(params[:id])
    render json: list
  end

  def create
    monkey = Monkey.new(monkey_params)
    if monkey.save
      render status: 200, json: {
          message: "Successfully created monkey.",
          todo_list: monkey
      }.to_json
    else
      render status: 422, json: {
        errors: monkey.errors
      }
    end
  end

  def destroy
    monkey = Monkey.find(params[:id])
    monkey.destroy
    render status: 200, json: {
        message: "Successfully deleted monkey"
    }.to_json
  end

  def update
    monkey = Monkey.find(params[:id])
    if monkey.update(monkey_params)
      render status: 200, json: {
          message: "Successfully updated!",
          monkey: monkey
      }.to_json
    else
      render status: 422, json: {
          errors: monkey.errors
      }.to_json
    end
  end

  private
  def monkey_params
    params.require("monkey").permit("body")
  end
end