get '/download/statistic' do
  @downloads = Download.all
  haml :statistic
end

get '/download/:name' do
  if File.exist?(S_PARAMS["root"]+params[:name]) then
    Download.find_or_create(params[:name])
  end
  headers({"X-Accel-Redirect" => S_PARAMS["server_path"] + params[:name] })
  ""
end

#test