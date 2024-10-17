class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :check_comment_owner, only: [:edit, :update, :destroy]

  # GET /comments or /comments.json
  def index
  end

  # GET /comments/1 or /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new  
    @parent_comment = Comment.find(params[:parent_id]) if params[:parent_id].present?
  end

  # GET /comments/1/edit
  def edit
    @post = Post.find(@comment.post_id)
  end

  # POST /comments or /comments.json
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.new(comment_params)
    #@comment.user == current_user
    if @comment.save
      redirect_to Post.find(@comment.post_id), notice: 'Comment was successfully created.'
    else
      #render :new
      redirect_to Post.find(@comment.post_id), alert: 'Comment could not be created.'
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to Post.find(@comment.post_id), notice: 'Comment was successfully updated.'
    else
      redirect_to Post.find(@comment.post_id), alert: 'Comment could not be updated.'
    end
  end

    #respond_to do |format|
    #  if @comment.update(comment_params)
    #   format.html { redirect_to comments_path, notice: "Comment was successfully updated." }
    #    format.json { render :show, status: :ok, location: @comment }
    #  else
    #    format.html { render :edit, status: :unprocessable_entity }
    #    format.json { render json: @comment.errors, status: :unprocessable_entity }
    #  end 

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.destroy
      redirect_to @post, notice: 'Comment was successfully deleted.'
    else
      redirect_to @post, alert: 'Comment could not be deleted.'
    end
  end

    #@comment.destroy!
    #respond_to do |format|
     # if @comment.user == current_user
    #  format.html { redirect_to comments_path, status: :see_other, notice: "Comment was successfully destroyed." }
    #  format.json { head :no_content }
      #else 
       # format.html { redirect_to @comment, alert: 'You are not authorized to delete this post.' }
        #format.json { render json: { error: 'Unauthorized' }, status: :forbidden }
    #end
  #end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment 
      begin 
        @comment = Comment.find(params[:id])
       rescue ActiveRecord::RecordNotFound
         redirect_to comments_path, alert: 'Comment not found.'
       end
    end
  
      #@post = Post.find(params[:post_id])
      #@comment = @post.comments.find(params[:id])
    #rescue ActiveRecord::RecordNotFound
      #redirect_to comments_path(@post), alert: 'Comment not found.'

    def check_comment_owner
      redirect_to posts_path, alert: 'You are not authorized to perform this action.' unless @comment.user == current_user
    end
  
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :parent_id).merge(user_id: current_user.id)
      #params.require(:comment).permit(:body, :post_id).merge(user_id: current_user.id)
      #params.require(:comment).permit(:body, :post_id, :user_id, :parent_id)
    end
end