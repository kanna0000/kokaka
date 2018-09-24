class BalancesController < ApplicationController
  before_action :set_balance, only: [:show, :edit, :update, :destroy]

  # GET /balances
  # GET /balances.json
  def index
    @balances = Balance.all
  end

  # GET /balances/1
  # GET /balances/1.json
  def show
  end

  # GET /balances/new
  def new
    @balance = Balance.new
  end

  # GET /balances/1/edit
  def edit
  end

  # POST /balances
  # POST /balances.json
  def create
    @balance = Balance.new(balance_params)
    @balance.calculate_balance params[:balance][:amount]

    respond_to do |format|
      if @balance.save
        format.html { redirect_to @balance, notice: 'Balance was successfully created.' }
        format.json { render :show, status: :created, location: @balance }
      else
        format.html { render :new }
        format.json { render json: @balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /balances/1
  # PATCH/PUT /balances/1.json
  def update
    @balance = Balance.find(params[:id])
    if params[:balance][:send_to] == @balance.primary_user
      @balance.update_balance_as_sub params[:balance][:amount]
    else
      @balance.update_balance_as_primary params[:balance][:amount]
    end
    respond_to do |format|
      if @balance.update(balance_params)
        format.html { redirect_to @balance, notice: 'Balance was successfully updated.' }
        format.json { render :show, status: :ok, location: @balance }
      else
        format.html { render :edit }
        format.json { render json: @balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /balances/1
  # DELETE /balances/1.json
  def destroy
    @balance.destroy
    respond_to do |format|
      format.html { redirect_to balances_url, notice: 'Balance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balance
      @balance = Balance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def balance_params
      params.require(:balance).permit(:primary_user, :sub_user, :balance, :is_positive)
    end
end
