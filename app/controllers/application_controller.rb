# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include PostsHelper
  include CommentsHelper
  include UsersHelper
end
