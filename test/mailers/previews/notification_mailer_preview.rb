# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/transaction_success
  def transaction_success
    NotificationMailer.transaction_success
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/error
  def error
    NotificationMailer.error
  end

end
