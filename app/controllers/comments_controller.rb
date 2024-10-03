class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    # Check if the comment is a reply
    if params[:comment][:parent_id].present?
      @comment.parent_id = params[:comment][:parent_id]
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comments_path, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.user == current_user
        @comment.destroy!
        format.html { redirect_to comments_path, status: :see_other, notice: "Comment was successfully destroyed." }
        format.json { head :no_content }
      else 
        format.html { redirect_to @comment, alert: 'You are not authorized to delete this post.' }
        format.json { render json: { error: 'Unauthorized' }, status: :forbidden }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      rescue ActiveRecord::RecordNotFound
       redirect_to comments_path, alert: 'Comment not found.'
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id, :parent_id)
    end
end
