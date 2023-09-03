class Api::V1::ContentsController < ApplicationController
  def index
    content = Content.all
    render json: content, status: 200
  end

  def show
    content = Content.find_by(id: params[:id])
    if content
      render json: content, status: 200
    else
      render json: {
        error: "Content not found"
      }
    end
  end

  def create
    content = Content.new(
      title: cont_params[:title],
      body: cont_params[:body]
    )
    if content.save
      render json: content, status: 200
    else
      render json: {
        error: "Error Creating.."
      }
    end
  end

  def update
    content = Content.find_by(id: params[:id])
    if content
      content.update(title: params[:title], body: params[:body])
      render json: "Content Record Updated Successfully"
    else
      render json: {
        error: "Content Not Found"
      }
    end
  end

  def destroy
    content = Content.find_by(id: params[:id])
    if content
      content.destroy
      render json: "Content has been deleted"
    end
  end

  private
  def cont_params
    params.require(:content).permit([
      :title,
      :body
                                    ])
  end

  def user_json_content

  end
end
