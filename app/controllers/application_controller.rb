require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :'/posts/new'
  end

  post '/posts' do
    @post = Post.create(params[:post])

    redirect "/posts"
  end

  get '/posts' do
    erb :index
  end

  patch '/posts/:id' do
    Post.find_by_id(params[:id]).update(params[:post])
    @post = Post.find_by_id(params[:id])
    redirect "/posts/#{@post.id}"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'/posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'/posts/edit'
  end

  delete '/posts/:id/delete' do
    @post_name = Post.find_by_id(params[:id]).name
    Post.find_by_id(params[:id]).destroy
    erb :'/posts/delete'

  end

end
