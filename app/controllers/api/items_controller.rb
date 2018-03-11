class Api::ItemsController < Api::ApiController

  before_filter :find_monkey

  def create
    item = @monkey.items.new(item_params)
    if item.save
      render status: 200, json: {
          message: "Successfully created item.",
          monkey: @monkey,
          item: item
      }
    else
      render status: 422, json: {
          message: "Monkey item creation failed.",
          monkey: @monkey,
          errors: item.errors
      }
    end
  end

  def update
    item = @monkey.items.find(params[:id])
    if item.update(item_params)
      render status: 200, json: {
          message: "Successfully updated item.",
          monkey: @monkey,
          item: item
      }
    else
      render status: 422, json: {
          message: "Monkey item update failed.",
          monkey: @monkey,
          errors: item.errors
      }
    end
  end

  def destroy
    item = @monkey.items.find(params[:id])
    item.destroy
    render status: 200, json: {
        message: "Successfully destroyed item.",
        monkey: @monkey,
        item: item
    }
  end

  private
  def item_params
    params.require("item").permit("title")
  end

  def find_monkey
    @monkey = Monkey.find(params[:monkey_id])
  end
end