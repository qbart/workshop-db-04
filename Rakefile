require_relative "./app/boot"
require "sinatra/activerecord/rake"

desc "Refresh all materialized views"
task :refresh_mat_views do
  MatUserArticleStat.refresh
end