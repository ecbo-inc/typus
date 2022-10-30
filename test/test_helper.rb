ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment',  __FILE__)

ActiveRecord::Schema.verbose = false
require File.expand_path('../dummy/db/schema',  __FILE__)

require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/mock'

Rails.backtrace_cleaner.remove_silencers!
Rails.application.config.action_view.raise_on_missing_translations = true

class ActiveSupport::TestCase

  fixtures :all

  teardown do
    reset_session
  end

  def db_adapter
    ::ActiveRecord::Base.connection_db_config.configuration_hash[:adapter]
  end

  def build_admin
    @typus_user = typus_users(:admin)
  end

  def admin_sign_in
    build_admin
    set_session(@typus_user.id)
  end

  def build_editor
    @typus_user = typus_users(:editor)
  end

  def editor_sign_in
    build_editor
    set_session(@typus_user.id)
    @request.env['HTTP_REFERER'] = '/admin/typus_users'
  end

  def build_designer
    @typus_user = typus_users(:designer)
  end

  def designer_sign_in
    build_designer
    set_session(@typus_user.id)
  end

  def set_session(id)
    @request.session[:typus_user_id] = id
  end

  def reset_session
    @request.session[:typus_user_id] = nil if @request
  end

end
