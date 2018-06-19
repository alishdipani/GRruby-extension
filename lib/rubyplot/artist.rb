
module Rubyplot
  class Artist
    attr_accessor :title
    def initialize
      @tasks=[]
      @title= NIL
    end

    def draw

    end

    def write filename
      draw
    	GR.beginprint(filename)
    	@tasks.each do |task|
    		task.call()
    	end
    	GR.endprint()

    end

    def add_legend dataname

    end

  end
end