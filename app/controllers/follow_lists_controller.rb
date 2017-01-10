class FollowListsController < ApplicationController
  before_action :set_follow_list, only: [:show, :edit, :update, :destroy]

  # GET /follow_lists
  # GET /follow_lists.json
  def index
    @follow_lists = FollowList.all
  end

  # GET /follow_lists/1
  # GET /follow_lists/1.json
  def show
  end

  # GET /follow_lists/new
  def new
    @follow_list = FollowList.new
  end

  # GET /follow_lists/1/edit
  def edit
  end

  # POST /follow_lists
  # POST /follow_lists.json
  def create
    @follow_list = FollowList.new(follow_list_params)

    respond_to do |format|
      if @follow_list.save
        format.html { redirect_to @follow_list, notice: 'Follow list was successfully created.' }
        format.json { render :show, status: :created, location: @follow_list }
      else
        format.html { render :new }
        format.json { render json: @follow_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follow_lists/1
  # PATCH/PUT /follow_lists/1.json
  def update
    respond_to do |format|
      if @follow_list.update(follow_list_params)
        format.html { redirect_to @follow_list, notice: 'Follow list was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow_list }
      else
        format.html { render :edit }
        format.json { render json: @follow_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follow_lists/1
  # DELETE /follow_lists/1.json
  def destroy
    @follow_list.destroy
    respond_to do |format|
      format.html { redirect_to follow_lists_url, notice: 'Follow list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow_list
      @follow_list = FollowList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follow_list_params
      params.require(:follow_list).permit(:user_id, :follow_id)
    end
end
