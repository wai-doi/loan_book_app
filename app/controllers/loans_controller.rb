class LoansController < ApplicationController
  before_action :set_loan, only: [:edit, :update, :destroy]

  def show_all
    @loans = Loan.all.order(created_at: :desc)
  end

  # GET /loans
  # GET /loans.json
  def index
    p @loans = Loan.where(on_loan: true)
    @loan = Loan.new
    @loan.on_loan ||= true
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)
    @loan.on_loan ||= true
    @loans = Loan.where(on_loan: true)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to root_path, notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :index }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to root_path, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to all_path, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def swich
    @loan = Loan.find(params[:id])
    @loan.update_attribute(:on_loan, false)
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:name, :book, :days)
    end
end
