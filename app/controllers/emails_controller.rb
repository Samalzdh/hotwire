class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @new_email = Email.create(object: Faker::JapaneseMedia::OnePiece.character, body: Faker::JapaneseMedia::OnePiece.quote)
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "create_email", partial: "emails/email", locals: { email: @new_email }
        )
      end
      format.html { redirect_to emails_path }
    end
  end

  def show 
    @emails = Email.all
    @email = Email.find(params[:id])
  end
end
