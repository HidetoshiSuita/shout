class LikeListsController < ApplicationController
  before_action :set_like_list, only: [:show, :edit, :update, :destroy]

  # GET /like_lists
  # GET /like_lists.json
  def index
    @like_lists = LikeList.all
  end

  # GET /like_lists/1
  # GET /like_lists/1.json
  def show
  end

  # GET /like_lists/new
  def new
    @like_list = LikeList.new
  end

  # GET /like_lists/1/edit
  def edit
  end

  # POST /like_lists
  # POST /like_lists.json
  def create
    @like_list = LikeList.new(like_list_params)

    respond_to do |format|
      if @like_list.save
        format.html { redirect_to @like_list, notice: 'Like list was successfully created.' }
        format.json { render :show, status: :created, location: @like_list }
      else
        format.html { render :new }
        format.json { render json: @like_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /like_lists/1
  # PATCH/PUT /like_lists/1.json
  def update
    respond_to do |format|
      if @like_list.update(like_list_params)
        format.html { redirect_to @like_list, notice: 'Like list was successfully updated.' }
        format.json { render :show, status: :ok, location: @like_list }
      else
        format.html { render :edit }
        format.json { render json: @like_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /like_lists/1
  # DELETE /like_lists/1.json
  def destroy
    @like_list.destroy
    respond_to do |format|
      format.html { redirect_to like_lists_url, notice: 'Like list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like_list
      @like_list = LikeList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_list_params
      params.require(:like_list).permit(:shout_id, :user_id)
    end
end
