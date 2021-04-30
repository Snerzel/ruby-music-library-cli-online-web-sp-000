class MusicImporter
  attr_accessor :path, :song, :artist, :genre, :musiclibrarycontroller

  def initialize(path)
    @path = path
  end

  def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each {|file| Song.create_from_filename(file) }
  end


end
