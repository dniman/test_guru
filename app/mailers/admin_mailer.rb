class AdminMailer < ApplicationMailer

  def send_message(data)
    @data = data
    @admin = Admin.first
    
    mail to: @admin.email, subject: 'New message from visitor!'
  end

end
