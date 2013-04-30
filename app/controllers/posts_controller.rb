class PostsController < InheritedResources::Base
  load_and_authorize_resource

  def new

  end

  def create
    resource.user = current_user
    create! do |success, failure|
      success.html {
        flash.now.notice = "Post creation successful."
        redirect_to @post
      }
      failure.html {
        flash.now.alert = @post.errors.to_a
        render 'new'
      }
    end
  end

  def show
  end

  def edit

  end

  def update
    update! do |success, failure|
      success.html {
        flash.now.notice = "Post update successful."
        redirect_to @post
      }
      failure.html {
        flash.now.alert = @post.errors.to_a
        render 'edit'
      }
    end
  end

  def index
    redirect_to root_path
  end
end
