class Api::V1::ContentsController < ApplicationController
  def index
    contents = Content.all
    puts "hello"
    render json: {data: contents.map {|content| users_json(content)}}, status: 200
  end

  def show
    content = Content.find_by(id: params[:id])
    if content
      render json: user_json(content), status: 200
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
      render json: user_json(content), status: 200
    else
      render json: {
        error: "Error Creating. You need to write title and body."
      }
    end
  end

  def update
    content = Content.find_by(id: params[:id])
    if content
      content.update(title: params[:title], body: params[:body])
      render json: user_json(content)
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
      render json: {message: "Deleted"}
    else
      render json: {
        error: "Content not exists"
      }
    end
  end

  private
  def cont_params
    params.require(:content).permit([
      :title,
      :body
                                    ])
  end


  def user_json(content)
    {
      data:{
        id: content.id,
        type: 'content',
        attributes:{
          title: content.title,
          body: content.body,
          createdAt: content.created_at,
          updatedAt: content.updated_at
        }
      }
    }
  end

  def users_json(content)
    {
    id: content.id,
    type: 'content',
    attributes:{

      title: content.title,
      body: content.body,
      createdAt: content.created_at,
      updatedAt: content.updated_at
     }
    }
  end
end
