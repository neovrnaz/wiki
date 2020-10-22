# frozen_string_literal: true

require 'sinatra'
require 'uri'

# Class for linking the page views
class WikiApp < Sinatra::Base

  def page_content(title)
    File.read("pages/#{title}.txt")
  rescue Errno::ENOENT
    return nil
  end

  def save_content(title, content)
    File.open("pages/#{title}.txt", 'w') do |file|
      file.print(content)
    end
  end

  get '/' do
    erb :welcome
  end

  get '/new' do
    erb :new
  end

  get '/:title' do
    @title = params[:title]
    @content = page_content(@title)
    erb :show
  end

  get '/:title/edit' do
    @title = params[:title]
    @content = page_content(@title)
    erb :edit
  end

  post '/create' do
    save_content(params['title'], params['content'])
    # redirect URI.escape("/#{params['title']}")
    redirect URI.encode_www_form([%w[/title title], %w[lang en]])
  end

  put '/:title' do
    save_content(params['title'], params['content'])
    URI.encode_www_form([%w[/title title], %w[lang en]])
  end
end
