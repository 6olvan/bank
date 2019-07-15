class NotificationMailer < ApplicationMailer
  BANK_ADMIN = 'admin@mail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.transaction_success.subject
  #
  def transaction_success(transaction)
    @transaction = transaction

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.error.subject
  #
  def error(msg, bt)
    @msg = msg
    @bt = bt

    mail to: BANK_ADMIN
  end
end
