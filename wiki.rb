require 'sinatra'

class WikiApp < Sinantra::Base

  def page_content(title)
    File.read("pages/#{title}.txt")
  rescue Errno::ENOENT
    return nil
  end

  get '/' do
    erb :welcome
  end

  get '/:title' do
    page_content(params[:title])
  end
end