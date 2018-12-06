class ExporterMailer < ApplicationMailer
  def reception_confirmation(sample)
    @sample = sample
    @exporter = @sample.exporter
    mail(to: @exporter.email, subject: "reception Confirmation | #{sample.id}")
  end
end
