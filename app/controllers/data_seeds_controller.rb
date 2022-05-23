require 'rake'

class DataSeedsController < ApplicationController
  def create
    Rails.application.load_tasks
    Rake::Task['db:seed'].invoke

    redirect_to root_path
  end
end
