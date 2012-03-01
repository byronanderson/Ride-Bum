class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = "johnathan@jpulos.com"
  end
end
