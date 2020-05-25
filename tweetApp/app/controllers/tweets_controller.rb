class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :own_tweets, :destroy, :edit]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    flash[:notice] = "Sorry, This Profile belongs to someone else !"
    if current_user.id == @tweet.user_id then
    else
      redirect_to '/users/index', alert: "Sorry, This Profile belongs to someone else !"
    end
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    flash[:notice] = "Sorry, This Profile belongs to someone else !"
    if current_user.id == @tweet.user_id then
      @tweet.destroy
      respond_to do |format|
        format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to '/users/index', alert: "Sorry, This Profile belongs to someone else !"
    end
  end

  def own_tweets
    @own_tweets = Tweet.where(user_id: current_user.id)
    @tweets = @own_tweets
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body, :user_id)
    end
end
