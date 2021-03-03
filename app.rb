require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all 
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

post('/albums') do
  name = params[:album_name]
  year = params[:album_year]
  artist = params[:album_artist]
  genre = params[:album_genre]
  album = Album.new(name, year, artist, genre, nil)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

# post ('/albums') do
#   @album = Album.search(params[:name].to_s())
#   erb(:edit_album)
# end