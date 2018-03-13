class App < Sinatra::Base
  TITLE = "WDB04 - Views"

  set :public_folder, -> { File.join(root, "..", "public") }
  set :views, -> { File.join(root, "views") }

  register Sinatra::ActiveRecordExtension

  if !RackEnv.prod?
    get '/q' do
      @result = nil
      @rows = 10
      haml :'q/index'
    end

    post '/q' do
      @rows = [params[:query].count("\n") + 1, 10].max
      begin
        @result = ActiveRecord::Base.connection.select_all(params[:query])
      rescue ActiveRecord::StatementInvalid => e
        @error = e
      end

      haml :'q/index'
    end
  end

  get '/' do
    haml :'home/show'
  end

  get '/intro' do
    @mod_published = current_user.articles.published
    @mod_drafts    = current_user.articles.drafts

    @published = current_user.published_articles
    @drafts    = current_user.drafts

    haml :'views/intro'
  end

  get '/updatable' do
    haml :'views/updatable'
  end

  def current_user
    @user ||= User.first
  end

end
