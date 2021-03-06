module Rubyplot
  module Scripting
    module Plots
      class StackedBar < BasePlots::LazyBase
        def initialize(data, bar_colors: :default, bar_width: :default,
                       bar_gap: :default, bar_edge: :default,
                       bar_edge_color: :default, bar_edge_width: :default)
          super()
          @bar_colors = bar_colors
          @bar_gap = bar_gap
          @bar_width = bar_width
          @bar_edge = bar_edge
          @bar_edge_color = bar_edge_color
          @bar_edge_width = bar_edge_width

          @bar_gap = 0 if @bar_gap == :default
          @bar_width = 1 if @bar_width == :default
          @bar_edge_width = 0.053 if @bar_edge_width == :default
          @bar_edge = true if @bar_edge == :default
          @bar_edge = true if @bar_edge == :default
          @bar_colors = CONTRASTING_COLORS if @bar_colors == :default
          @bar_edge_color = COLOR_INDEX[:black] if @bar_edge_color == :default
          @bar_edge_color = COLOR_INDEX[marker_color] if @bar_edge_color.is_a? Symbol
          @data = data
          # All this will be repurposed
        end

        def call(state)
          # for Lazy plots the state has been passed  in the plotspace call
          # every lazy plot will have a call function rather than inherting it
          # tasks wont be pushed, rather they will be instantiated and called directly
          (0..@data[0].size - 1).to_a.each do |i|
            base = state.origin[1]
            bars = @data.map{|row| row[i]}
            (0..bars.size-1).to_a.each do |j|
              if @bar_edge
                SetFillColorIndex.new(hex_color_to_gr_color_index(@bar_edge_color)).call
                SetFillInteriorStyle.new(GR_FILL_INTERIOR_STYLES[:solid]).call
                FillRectangle.new(i * (@bar_width + @bar_gap) - @bar_edge_width,
                                  i * (@bar_width + @bar_gap) + @bar_width + @bar_edge_width,
                                  base, base + bars[j] + 2 * @bar_edge_width).call
              end
              bar_color = @bar_colors[j]
              bar_color = COLOR_INDEX[bar_color] if bar_color.is_a? Symbol
              SetFillColorIndex.new(hex_color_to_gr_color_index(bar_color)).call
              SetFillInteriorStyle.new(GR_FILL_INTERIOR_STYLES[:solid]).call
              FillRectangle.new(i * (@bar_width + @bar_gap),
                                i * (@bar_width + @bar_gap) + @bar_width,
                                base, base + bars[j]).call
              base += bars[j]
            end
          end
        end
      end
    end
  end
end
