# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_admin_credentials, only: %i[index]
  before_action :set_admin, only: %i[index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = if user_signed_in?
               Post.where(user_id: current_user.id).order(updated_at: :desc)
             end
  end

  # for search func
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
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
    @user = User.find(@post.user_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:user_id, :name, :content, :date)
  end

  def set_admin_credentials
    @nm = Rails.application.credentials.dig(:admin, :uid).to_s
    @pr = Rails.application.credentials.dig(:admin, :provider).to_s
  end

  def set_admin
    @admin = User.find_or_initialize_by(admin: true)
    if @admin.new_record?
      @admin.update_attributes!(provider: @pr, uid: @nm, email: "#{@nm}-#{@pr}@example.com", name: 'OriverK')
    end
    post = Post.find_or_initialize_by(user_id: @admin.id)
    if post.new_record?
      post.update_attributes!(name: 'ruby rails omniauth twitter redcarpet rouge js awss3', date: Time.now,
                              content: "# Let's Write and Share your Code on Twitter!\nI made this as my portforlio. Plz access footer links.\n## What for\nCode shared on twitter looks not good.(e.g. Some codes turn to link)\n## How\n1. U can Post with markdown format\n2. Push tweet, then the post will be saved onto AWS S3 as image\n\nImage is used only as og:image for twitter card.\n\n```\n<h1>From Now<h2>\n<div>\n  <p>Need to implement syntax-highlight function<p>\n  <p>And to implement more functions</p>\n</div>\n```")
    end
    @adminPost = Post.where(user_id: @admin.id).order(created_at: :asc).take
  end
end
