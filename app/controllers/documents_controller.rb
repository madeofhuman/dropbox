class DocumentsController < ApplicationController
  before_action :set_document, only: %i[destroy]

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = 'File saved'
      redirect_to documents_path
    else
      render 'new'
    end
  end

  def destroy
    @document.destroy
    if @document.destroyed?
      flash[:success] = 'File deleted'
    else
      flash[:error] = 'Unable to delete file, please contact the administrator'
    end
    redirect_to documents_path
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:file)
  end
end
