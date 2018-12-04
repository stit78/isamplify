# Preview all emails at http://localhost:3000/rails/mailers/exporter_mailer
class ExporterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/exporter_mailer/reception_confirmation
  def reception_confirmation
    exporter = User.first
    ExporterMailer.reception_confirmation(exporter)
  end

end
