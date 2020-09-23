# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles=Article.order(created_at:"DESC")
  end

  def new
    @article=Article.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
