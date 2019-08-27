
namespace :imports do
  desc "import artists from spotyfy"
  task artists: :environment do
    RSpotify.authenticate( "76ef95421e3a4e7aac6358eba6727257", "7e1bd001c4c34315a14c6177c1eaf880")

    YAML.load_file("#{Rails.root}/config/artists.yml")['artists'].each do |artist|
      artist = RSpotify::Artist.search(artist.to_s).first

      Artist.connection
      if artist
        a = Artist.create(
          name: artist.name, image: artist.images.first['url'],
          genres: artist.genres.to_a.map { |genre| genre.gsub(" ", "_") },
          popularity: artist.popularity, spotify_url: artist.external_urls['spotify'],
          spotify_id: artist.id
        )

        artist.albums.each do |album|
          sleep 1
          alb = a.albums.create(
            name: album.name, image: album.images.first['url'], spotify_url: album.external_urls['spotify'],
            total_tracks: album.total_tracks, spotify_id: album.id
          )

          album.tracks.each do |track|
            sleep 1
            alb.songs.create(
              name: track.name, spotify_url: track.external_urls['spotify'], preview_url: track.preview_url,
              duration_ms: track.duration_ms, explicit: track.explicit, spotify_id: track.id
            )
          end
        end
      end
    end
  end
end


