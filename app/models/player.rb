module Spot
  class Player

    def self.state
      `./script/get-state`
    end

    def self.playing
      song = `./script/playing`.gsub /(?<!\n)\n(?!\n)/, ''
      "Now playing #{song}..."
    end

    def self.playingUri
      uri = `./script/playing-uri`
      uri
    end

    def self.artwork
      art = `./script/artwork`.gsub /(?<!\n)\n(?!\n)/, ''
    end

    def self.play
      `./script/play`
      self.playing
    end

    def self.pause
      `./script/pause`
      "Everything is paused."
    end

    def self.next
      `./script/next`
      "Onwards! #{self.playing}"
    end

    def self.back
      `./script/back`
      "Let's hear it again! #{self.playing}"
    end

    def self.mute
      `./script/mute`
      'Shhh...'
    end

    def self.volume
      vol = `./script/get-volume`.gsub /(?<!\n)\n(?!\n)/, ''
      vol.to_i
    end

    def self.osVolume
      vol = `./script/get-real-volume`.gsub /(?<!\n)\n(?!\n)/, ''
      vol.to_i
    end

    def self.how_much_longer
      `./script/how-much-longer`
    end

    def self.volume=(vol)
      vol+=1
      `./script/set-volume #{vol}`
      vol
    end

    def self.osVolume=(vol)
      vol+=1
      `./script/set-real-volume #{vol}`
      vol
    end

    def self.play_song(spotifyTrack)
      `./script/play-song #{spotifyTrack}`
      self.playing
    end

    def self.say(what)
      currentVolume = self.volume
      self.volume=currentVolume/3
      `say #{what}`
      self.volume = currentVolume
    end

    def self.shipit
      `open /Users/admin/bigboard/prodrelease.app`
    end

    def self.shipitadminv1
      `open /Users/admin/bigboard/admin-v1-release.app`
    end

    def self.shipitadminv2
      `open /Users/admin/bigboard/admin-v2-release.app`
    end

    def self.shipitinventory
      `open /Users/admin/bigboard/inventory-release.app`
    end

    def self.shipitidentity
      `open /Users/admin/bigboard/identity-release.app`
    end

    def self.shipitecom
      `open /Users/admin/bigboard/ecom-release.app`
    end

    def self.shipitusercomm
      `open /Users/admin/bigboard/usercomm-release.app`
    end

    def self.shipitcms
      `open /Users/admin/bigboard/cms-release.app`
    end

    def self.shipitquery
      `open /Users/admin/bigboard/query-release.app`
    end

    def self.dale
      `open /Users/admin/bigboard/damnitdale.app`
    end

    def self.mothraqa
      `open /Users/admin/bigboard/mothra-qa.app`
    end

    def self.mothradev
      `open /Users/admin/bigboard/mothra-dev.app`
    end

    def self.mothradevstable
      `open /Users/admin/bigboard/mothra-dev-stable.app`
    end

    def self.mothrastage
      `open /Users/admin/bigboard/mothra-stage.app`
    end

    def self.deathstar
      `open /Users/admin/bigboard/deathstar.app`
    end

    def self.mechawins
      `open /Users/admin/bigboard/mecha-wins.app`
    end

    def self.mechaloses
      `open /Users/admin/bigboard/mecha-loses.app`
    end
  end
end
