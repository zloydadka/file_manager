

get '/download/:name' do
  path = S_PARAMS["root"]+params[:name]
  if File.exist?(path) then
  send_file(S_PARAMS["server_path"]+params[:name])
  end
end