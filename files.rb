

get '/download/:name' do
  path = S_PARAMS["root"]+params[:name]
  if File.exist?(path) then
  send_file(path)
  end
end