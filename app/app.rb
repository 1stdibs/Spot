require 'models/player'
require 'models/spotify'
require 'logger'
require 'json'

AUTHORIZED_IPS=['192.168.100.44','127.0.0.1']

module Spot
  class App < Sinatra::Base

    configure do
      enable :logging
      `./script/boot`
    end

    get '/' do
      'Welcome to Spot!<br/>http://github.com/minton/Spot'
    end

    get '/test' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        "AUTHORIZED"
      else
        "UNAUTHORIZED"
      end
    end

    put '/say' do
      what = params[:what]
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.say(what)
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipit
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit-adminv1' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipitadminv1
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit-adminv2' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipitadminv2
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit-inventory' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipitinventory
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit-identity' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipitidentity
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit-ecom' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipitecom
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit-cms' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipitcms
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit-usercomm' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipitusercomm
      else
        "UNAUTHORIZED"
      end
    end

    get '/shipit-query' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.shipitquery
      else
        "UNAUTHORIZED"
      end
    end

    get '/damnit-dale' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.dale
      else
        "UNAUTHORIZED"
      end
    end

    get '/mothra-qa' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.mothraqa
      else
        "UNAUTHORIZED"
      end
    end

    get '/mothra-dev' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.mothradev
      else
        "UNAUTHORIZED"
      end
    end

    get '/mothra-dev-stable' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.mothradevstable
      else
        "UNAUTHORIZED"
      end
    end

    get '/mothra-stage' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.mothrastage
      else
        "UNAUTHORIZED"
      end
    end

    get '/mechawins' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.mechawins
      else
        "UNAUTHORIZED"
      end
    end

    get '/mechaloses' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.mechaloses
      else
        "UNAUTHORIZED"
      end
    end

    get '/deathstar' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.deathstar
      else
        "UNAUTHORIZED"
      end
    end

    put '/play' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.volume = 45
        Player.play
      else
        "UNAUTHORIZED"
      end
    end

    put '/pause' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.pause
      else
        "UNAUTHORIZED"
      end
    end

    put '/mute' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.mute
      else
        "UNAUTHORIZED"
      end
    end

    get '/playing' do
     Player.playing
    end

    put '/next' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.next
      else
        "UNAUTHORIZED"
      end
    end

    put '/back' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.back
      else
        "UNAUTHORIZED"
      end
    end

    get '/volume' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.volume.to_s
      else
        "UNAUTHORIZED"
      end
    end

    put  '/volume' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.volume = params[:volume].to_i and Player.volume.to_s unless params[:volume].nil?
      else
        "UNAUTHORIZED"
      end
    end

    get '/osVolume' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.osVolume.to_s
      else
        "UNAUTHORIZED"
      end
    end

    put  '/osVolume' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.osVolume = params[:volume].to_i and Player.volume.to_s unless params[:volume].nil?
      else
        "UNAUTHORIZED"
      end
    end

    put '/bumpup' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.volume = bump_up_volume.to_i
        Player.volume.to_s
      else
        "UNAUTHORIZED"
      end
    end

    put '/bumpdown' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.volume = Player.volume - bump_down_volume.to_i
        Player.volume.to_s
      else
        "UNAUTHORIZED"
      end
    end

    post '/find' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        query = params[:q]
        track_uri = Spotify.find(query)
        if track_uri.nil?
          "What the hell is you talkin' 'bout?"
        else
          Player.play_song(track_uri)
        end
      else
        "UNAUTHORIZED"
      end
    end

    post '/play-uri' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.play_song(params[:uri])
      else
        "UNAUTHORIZED"
      end
    end

    get '/play-youtube-uri' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.play_video(params[:uri])
      else
        "UNAUTHORIZED"
      end
    end

    get '/kill-video' do
      if AUTHORIZED_IPS.include? @env['REMOTE_ADDR']
        Player.kill_video()
      else
        "UNAUTHORIZED"
      end
    end

    get '/query' do
      tracks = Spotify.findTracks(params[:q])
      res = []
      tracks.each {|track|
        res.push(serialize_track(track))
      }
      response.headers['Content-Type'] = 'application/json'
      res.to_json
    end

    get '/single-query' do
      query = params[:q]
      track_data = Spotify.findData(query)
      response.headers['Content-Type'] = 'application/json'
      serialize_track(track_data).to_json
    end

    post '/just-find' do
      query = params[:q]
      track_data = Spotify.findData(query)
      if track_data.nil?
        return "What the hell is you talkin' 'bout?"
      end
      r_length = track_data.length
      if (r_length.to_i < 60)
        length = r_length + ' seconds'
      else
        length = sprintf('%d:%2d', (r_length.to_i / 60).floor, r_length.to_i % 60)
      end
      if defined? track_data.artist
        artist_name = track_data.artist.name
      else
        if defined? track_data.artists
          artist_name = com = ''
          track_data.artists.each {|artist|
            artist_name += com + artist.name
            com = ', '
          }
        else
          artist_name = 'Unknown'
        end
      end
      sprintf("I found:\nTrack: %s\nArtist: %s\nAlbum: %s [%s]\nLength: %s", track_data.name, artist_name, track_data.album.name, track_data.album.released, length)
    end

    get '/seconds-left' do
      Player.how_much_longer
    end

    get '/currently-playing' do
      Player.playingUri
    end

    get '/how-much-longer' do
      secs_str = Player.how_much_longer
      seconds_i = secs_str.to_i
      if (seconds_i < 60)
        return sprintf "There are %s seconds left", secs_str.strip!
      end
      minutes_i = (seconds_i / 60).floor
      seconds_i = seconds_i % 60
      sprintf("Time remaining: %d:%02d", minutes_i, seconds_i)
    end

    get '/playing.png' do
      content_type 'image/png'
      img = Player.artwork
      send_file img, :disposition => 'inline'
    end

    get %r{^/now/playing/} do
      content_type 'image/png'
      img = Player.artwork
      send_file img, :disposition => 'inline'
    end

    get '/album-info' do
      response.headers['Content-Type'] = 'application/json'
      serialize_album(Spotify.getAlbumInfo(params[:uri])).to_json
    end

    private

      def serialize_album(album)
        if album.nil?
          return {}
        end
        artists = []
        if defined? album.artist
          album.push({
            'name' => album.artist.name,
            'uri' => album.artist.uri
          })
        else
          if defined? album.artists and album.artists.length > 0
            album.artists.each {|artist|
              artists.push({
              'name' => artist.name,
              'uri' => artist.uri
              })
            }
          end
        end
        tracks = []
        album.tracks.each {
          |track|
          tracks.push(serialize_track(track))
        }
        {
          'name' => album.name,
          'artists' => artists,
          'released' => album.released,
          'tracks' => tracks
        }
      end

      def serialize_track(track)
        if track.nil?
          return {}
        end
        artists = []
        if defined? track.artist
          artists.push({
            'name' => track.artist.name,
            'uri' => track.artist.uri
          })
        else
          if defined? track.artists and track.artists.length > 0
            track.artists.each {|artist|
              artists.push({
              'name' => artist.name,
              'uri' => artist.uri
              })
            }
          end
        end
        obj = {
          'uri' => track.uri,
          'name' => track.name,
          'popularity' => track.popularity,
          'track_number' => track.track_number,
          'length' => track.length,
          'artists' => artists
        }
        if (not track.album.nil?)
          obj['album'] = {
            'name' => track.album.name,
            'released' => track.album.released,
            'uri' => track.album.uri
          }
        end
        obj
      end

      def bump_up_volume
        current_volume = Player.volume
        case current_volume
        when 0..10
          20
        when 11..30
          current_volume*1.45
        when 31..70
          current_volume*1.25
        else
          current_volume*1.1
        end
      end

      def bump_down_volume
        current_volume = Player.volume
        case current_volume
        when 100..80
          current_volume*0.3
        when 79..40
          current_volume*0.2
        else
          current_volume*0.1
        end
      end

  end
end
