# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = if user_signed_in?
               Post.where(user_id: current_user.id).order(updated_at: :desc)
             end            
  end

  # def search
  #   @postsAll = Post.where(user_id:current_user.id)
  #   logger.debug "============ params[:search] is #{search_params[:search]} ============="
  #   words = search_params[:search].split(/[[:blank:]]+/).select(&:present?)
  # minus_words, plus_words = words.partition {|word| word.start_with?("-") }

  # @posts = Post.none
  # plus_words.each do |word|
  #   @posts = @posts.or(Post.where("name LIKE ?", "%#{word}%"))
  # end
  # minus_words.each do |word|
  #   @posts.where!("name NOT LIKE ?", "%#{word.delete_prefix('-')}%")
  # end

  #   respond_to do |format|
  #     if words.blank?
  #       format.html { redirect_to posts_path, alert: "No words input!"}
  #       format.json { render :index, status: :not_found, location: @postsAll}
  #     elsif @posts.blank?
  #       format.html { redirect_to posts_path, alert: "No Posts found!"}
  #       format.json { render :index, status: :not_found, location: @postsAll}
  #     elsif @posts.present?
  #       format.html { redirect_to search_posts_path, notice: "#{@posts.count} Posts found!"}
  #       format.json { render :search, status: :ok, location: @posts}
  #     else
  #       format.html {redirect_to posts_path, alert: "Search Error!"}
  #       format.json { render :index, status: :unprocessable_entity, location: @postsAll}
  #     end
  #   end
  # end

  def show; end

  def new
    @post = Post.new(user_id: current_user.id, date: Time.now)
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :index, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params) && @post.parse_base64(params[:post][:prtsc])
        format.html { redirect_to @post, notice: 'Post and Image were successfully saved.' }
        format.json { render :show, status: :ok, location: post }
      elsif @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully saved.' }
        format.json { render :show, status: :ok, location: post }
      elsif @post.parse_base64(params[:post][:prtsc])
        format.html { redirect_to @post, notice: 'Image was successfully saved.' }
        format.json { render :show, status: :ok, location: post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:user_id, :name, :content, :date)
  end

  def search_params
    params.permit(:search)
  end
end
