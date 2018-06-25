module Rubyplot
  class Figure
    include Rubyplot::Scripting::Plots
    include Rubyplot::GRWrapper::Tasks
    attr_accessor :title, :grid, :bounding_box, :text_font
    def initialize
      @tasks = []
      @x_range = [0, 0]
      @y_range = [0, 0]
      @x_tick_count = :default
      @y_tick_count = :default
      @title = nil
      @title_shift = 0
      @drawn_flag = false
      @margin = 1 # Decides how many ticks above the higest value and
      @ticks_count = :default
      @drawing_size = :default
      @drawing_color = :default
      @text_font = :default
      @grid = true
      @bounding_box = true
      @data_represent_flag = false
      @data_plot_flag =  false
    end

    def scatter(x_coordinates, y_coordinates, marker_size: :default,
                marker_color: :default, marker_type: :default)
      if @data_represent_flag
        puts("\nThe figure is of data representation type")
        return
      else
        @data_plot_flag = true
      end
      if x_coordinates.min < @x_range[0]
        @x_range[0] = x_coordinates.min
      elsif x_coordinates.max > @x_range[1]
        @x_range[1] = x_coordinates.max
      end
      if y_coordinates.min < @y_range[0]
        @y_range[0] = y_coordinates.min
      elsif y_coordinates.max > @y_range[1]
        @y_range[1] = y_coordinates.max
      end
      @tasks.push(Scatter.new(x_coordinates, y_coordinates,
                  marker_size: marker_size, marker_color: marker_color,
                  marker_type: marker_type))
    end

    def line(x_coordinates, y_coordinates,line_width: :default,
             line_color: :default, line_type: :default,
             marker_size: :default, marker_color: :default,
             marker_type: :default)
      if @data_represent_flag
        puts("\nThe figure is of data representation type")
        return
      else
        @data_plot_flag = true
      end
      if x_coordinates.min < @x_range[0]
        @x_range[0] = x_coordinates.min
      elsif x_coordinates.max > @x_range[1]
        @x_range[1] = x_coordinates.max
      end
      if y_coordinates.min < @y_range[0]
        @y_range[0] = y_coordinates.min
      elsif y_coordinates.max > @y_range[1]
        @y_range[1] = y_coordinates.max
      end
      @tasks.push(Line.new(x_coordinates, y_coordinates,
                           line_width: line_width, line_color: line_color,
                           line_type: line_type, marker_size: marker_size,
                           marker_color: marker_color,
                           marker_type: marker_type))
    end

    def bar()
      if @data_plot_flag
        puts("\nThe figure is of data plotting type")
        return
      else
        @data_represent_flag = true
      end

    end

    def set_axis # for internal use before drawing
      #Automate tick sizes so that it is not too conjested
      if @title != nil # GR framework requires axes to be set up before plotting
        @title_shift = 0.1 # only decrease the plotting area if title is present
      end
      SetViewPort.new(0.05, 0.99, 0.05, 0.99 - @title_shift).call
      SetWindow.new(@x_range[0], @x_range[1], @y_range[0],@y_range[1]).call
      # Make sure that window is set bigger than range figure out how to manage it
      SetTextAlign.new(2, 0).call
      if @text_font == :default
        @text_font = :TIMES_ROMAN
      end
      SetTextFontPrec.new(GR_FONTS[@text_font], 0).call
      SetCharHeight.new(0.012).call
      @y_tick_count = 10 if @y_tick_count == :default
      @x_tick_count = 10 if @x_tick_count == :default #10 ticks by default
      Axes.new((@x_range[1] - @x_range[0]).to_f / @x_tick_count,
                           (@y_range[1] - @y_range[0]).to_f / @y_tick_count,
                           @x_range[0], @y_range[0], 1, 1, 0.01).call
      Grid.new((@x_range[1] - @x_range[0]).to_f / @x_tick_count,
                          (@y_range[1] - @y_range[0]).to_f / @y_tick_count,
                          @x_range[0], @y_range[0], 1, 1).call
      if @title_shift != 0
        SetCharHeight.new(0.05).call
        Text.new(0.5, 0.9, @title).call
      end
    end

    def view
      set_axis
      @tasks.each do |task|
        task.call()
      end
      UpdateWorkspace.new.call
      puts("\nPress any button to continue")
      gets
      ClearWorkspace.new.call
    end

    def save(file_name)
      BeginPrint.new(file_name).call
      set_axis
      @tasks.each do |task|
        task.call()
      end
      EndPrint.new.call
    end

    def clear!
      @tasks = []
      @x_range = [0, 0]
      @y_range = [0, 0]
      @x_tick_count = :default
      @y_tick_count = :default
      @title = nil
      @title_shift = 0
      @drawn_flag = false
      @margin = 1 # Decides how many ticks above the higest value and
      @ticks_count = :default
      @drawing_size = :default
      @drawing_color = :default
      @grid = true
      @bounding_box = true
      @data_represent_flag = false
      @data_plot_flag =  false
    end
  end
end


=begin
Known Bugs:
- Grid is working for #save but not for #display
=end
=begin
    class
      attr_accessor :title
      def initialize
        @tasks = []
        @title = nil
        @drawn_flag = false
      end

      def draw
        return if @drawn_flag
        @drawn_flag = true
      end

      def write(filename)
        draw
        GrBeginPrint.new(filename).call
        @tasks.each do |task|
          task.call()
        end
        GrEndPrint.new.call
      end

      def display
        draw
        @tasks.each do |task|
          task.call()
        end
        GrUpdateWs.new.call
        puts("\nPress any button to continue")
        gets
    end

=end
