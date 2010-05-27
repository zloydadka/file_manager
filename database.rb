require 'sinatra/sequel'
set :database, 'sqlite://foo.db'

puts "the downloads table doesn't exist" if !database.table_exists?('downloads')

migration "create  files table" do
  database.create_table :downloads do
    primary_key :id
    text        :name
    integer     :downloads, :default => 0
    timestamp   :last_download, :null => false

    index :name, :unique => true
  end
end

class Download < Sequel::Model
  
  def self.find_or_create(name)
    download = self.filter(:name => name).first || self.new(:name => name, :downloads => 0)
    download.last_download = Time.now
    download.downloads += 1
    download.save
  end
  
end