class JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]

  # GET /journal_entries
  # GET /journal_entries.json
  def index
    @journal_entries = JournalEntry.all.where(accounting_entry_id: params[:accounting_entry_id])
  end

  # GET /journal_entries/1
  # GET /journal_entries/1.json
  def show
  end

  # GET /journal_entries/new
  def new
    @journal_entry = AccountingEntry.find(params[:accounting_entry_id]).journal_entries.build
  end

  # GET /journal_entries/1/edit
  def edit
  end

  # POST /journal_entries
  # POST /journal_entries.json
  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    @journal_entry.accounting_entry = AccountingEntry.find(params[:accounting_entry_id])

    respond_to do |format|
      if @journal_entry.save
        format.html { redirect_to accounting_entry_journal_entries_path(params[:accounting_entry_id]), notice: 'Journal entry was successfully created.' }
        format.json { render :show, status: :created, location: @journal_entry }
      else
        format.html { render :new }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_entries/1
  # PATCH/PUT /journal_entries/1.json
  def update
    respond_to do |format|
      if @journal_entry.update(journal_entry_params)
        format.html { redirect_to accounting_entry_journal_entries_path(params[:accounting_entry_id]), notice: 'Journal entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal_entry }
      else
        format.html { render :edit }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_entries/1
  # DELETE /journal_entries/1.json
  def destroy
    @journal_entry.destroy
    respond_to do |format|
      format.html { redirect_to accounting_entry_journal_entries_url(params[:accounting_entry_id]), notice: 'Journal entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_entry
      @journal_entry = JournalEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def journal_entry_params
      params.require(:journal_entry).permit(:amount, :post_type, :account_id, :accounting_entry_id)
    end
end
