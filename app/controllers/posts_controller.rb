# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = if user_signed_in?
               Post.where(user_id: current_user.id).order(updated_at: :desc)
             end
    ad = User.find_by(admin:true)
    @admin = Post.find_by(user_id: ad.id)     
  end

  # def search
  #   if search_params.present?
  #     search_params.each do |i|
  #       @posts = Post.where(id:current_user.id).where("name = ?", i)
  #     end
  #     if @posts.blank?
  #       respond_to do |format|
  #       format.html { redirect_to posts_path, notice: 'Nothing found!' }
  #       format.json { head :no_content }
  #       end
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { redirect_to posts_path, notice: 'Search Error!' }
  #       format.json { head :no_content }
  #     end
  #   end
  # end

  # GET /posts/1
  # GET /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new(user_id: current_user.id, date: Time.now)
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  # POST /posts.json
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

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update!(post_params)
        if @post.parse_base64(params[:post][:prtsc])
        end
        format.html { redirect_to post_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
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
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:user_id, :name, :content, :date)
  end

  # def search_params
  #   params["search"].split(/ |　/)   
  # end
end
