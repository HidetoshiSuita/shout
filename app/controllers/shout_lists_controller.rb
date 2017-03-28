class ShoutListsController < ApplicationController
  before_action :set_shout_list, only: [:show, :edit, :update, :destroy]

  # GET /shout_lists
  # GET /shout_lists.json
  def index
    @shout_lists = ShoutList.all
  end

  # GET /shout_lists/1
  # GET /shout_lists/1.json
  def show
    redirect_to :back#:actina => "after_log_in_prosess" :action => "chouse"
  end

  # GET /shout_lists/new
  def new
    @shout_list = ShoutList.new
  end

  # GET /shout_lists/1/edit
  def edit
  end

  # POST /shout_lists
  # POST /shout_lists.json
  def create
    @shout_list = ShoutList.new(shout_list_params)

    respond_to do |format|
      if @shout_list.save
        format.html { redirect_to @shout_list, notice: 'Shout list was successfully created.' }
        format.json { render :show, status: :created, location: @shout_list }
      else
        format.html { render :new }
        format.json { render json: @shout_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shout_lists/1
  # PATCH/PUT /shout_lists/1.json
  def update
    respond_to do |format|
      if @shout_list.update(shout_list_params)
        format.html { redirect_to @shout_list, notice: 'Shout list was successfully updated.' }
        format.json { render :show, status: :ok, location: @shout_list }
      else
        format.html { render :edit }
        format.json { render json: @shout_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shout_lists/1
  # DELETE /shout_lists/1.json
  def destroy
    @shout_list.destroy
    respond_to do |format|
      format.html { redirect_to shout_lists_url, notice: 'Shout list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shout_list
      @shout_list = ShoutList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shout_list_params
      params.require(:shout_list).permit(:shout, :user_id, :emotion_no, :article_id)
    end
end
