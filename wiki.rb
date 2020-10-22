require 'sinatra'

class WikiApp < Sinatra::Base

  def page_content(title)
    File.read("pages/#{title}.txt")
  rescue Errno::ENOENT
    return nil
  end

  get '/' do
    erb :welcome
  end

  get '/:title' do
    @title = params[:title]
    @content = page_content(@title)
    erb :show
  end
end