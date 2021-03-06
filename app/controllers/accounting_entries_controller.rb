class AccountingEntriesController < ApplicationController
  before_action :set_accounting_entry, only: [:show, :edit, :update, :destroy]

  # GET /accounting_entries
  # GET /accounting_entries.json
  def index
    @accounting_entries = AccountingEntry.all
  end

  # GET /accounting_entries/1
  # GET /accounting_entries/1.json
  def show
    @journal_entries = JournalEntry.where(accounting_entry_id: params[:id])
  end

  # GET /accounting_entries/new
  def new
    @accounting_entry = AccountingEntry.new
  end

  # GET /accounting_entries/1/edit
  def edit
  end

  # POST /accounting_entries
  # POST /accounting_entries.json
  def create
    @accounting_entry = AccountingEntry.new(accounting_entry_params)

    respond_to do |format|
      if @accounting_entry.save
        format.html { redirect_to @accounting_entry, notice: 'Accounting entry was successfully created.' }
        format.json { render :show, status: :created, location: @accounting_entry }
      else
        format.html { render :new }
        format.json { render json: @accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting_entries/1
  # PATCH/PUT /accounting_entries/1.json
  def update
    respond_to do |format|
      if @accounting_entry.update(accounting_entry_params)
        format.html { redirect_to @accounting_entry, notice: 'Accounting entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting_entry }
      else
        format.html { render :edit }
        format.json { render json: @accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_entries/1
  # DELETE /accounting_entries/1.json
  def destroy
    @accounting_entry.destroy
    respond_to do |format|
      format.html { redirect_to accounting_entries_url, notice: 'Accounting entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_entry
      @accounting_entry = AccountingEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accounting_entry_params
      params.require(:accounting_entry).permit(:date_prepared, :date_posted, :memo)
    end
end
