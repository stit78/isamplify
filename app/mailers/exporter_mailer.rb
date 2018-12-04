class ExporterMailer < ApplicationMailer

  def reception_confirmation(exporter)
    @exporter = exporter
    # @sample = sample

    mail(to: @exporter.email, subject: "reception Confirmation | Sample sample.id")
  end
end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.exporter_mailer.reception_confirmation.subject
  #
