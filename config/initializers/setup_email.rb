ActionMailer::Base.default_url_options[:host] = YAML.load_file(File.join(Rails.root.to_s, "config", "config.yml"))[Rails.env]['host']
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
