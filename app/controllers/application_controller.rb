class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper # this adds Session Helper to all controllers
end
