Nift::Application.config.secret_key_base = if Rails.env.development? or Rails.env.test?
+  ('x' * 30) # meets minimum requirement of 30 chars long
+else
+  ENV['SECRET_TOKEN']
end
