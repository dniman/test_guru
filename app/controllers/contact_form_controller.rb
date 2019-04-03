class ContactFormController < ApplicationController

  def new
    @form = ContactForm.new
  end

  def send_message    
    @form = ContactForm.new(form_params)
    if @form.valid?
      AdminMailer.send_message(@form).deliver_now
      redirect_to root_url, notice: t('.successfully_sent')
    else
      render :new
    end
  end

  private

  def form_params
    params.require(:contact_form).permit(:name, :email, :message_body)
  end
end
