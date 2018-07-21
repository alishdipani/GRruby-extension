module Rubyplot
  module GRWrapper
    module Tasks
      def inqcolorfromrgb(rgbstring)
        rgb = rgbstring.match /#(..)(..)(..)/
        GR.inqcolorfromrgb((rgb[1].hex.to_f/255.0), (rgb[2].hex.to_f/255.0), (rgb[3].hex.to_f/255.0))
      end


      class BeginPrint
        attr_reader :file_name

        def initialize(file_name)
          @file_name = file_name
        end

        def call
          GR.beginprint(@file_name)
        end
      end

      class EndPrint
        def call
          GR.endprint
        end
      end

      class UpdateWorkspace
        def call
          GR.updatews
        end
      end

      class ClearWorkspace
        def call
          GR.clearws
        end
      end

      class Polymarker
        def initialize(x_coordinates, y_coordinates)
          @x_coordinates = x_coordinates
          @y_coordinates = y_coordinates
        end
        def call
          GR.polymarker(@x_coordinates, @y_coordinates)
        end
      end

      class Polyline
        def initialize(x_coordinates, y_coordinates)
          @x_coordinates = x_coordinates
          @y_coordinates = y_coordinates
        end
        def call
          GR.polyline(@x_coordinates, @y_coordinates)
        end
      end

      class FillRectangle
        def initialize(x_min, x_max, y_min, y_max)
          @x_min = x_min
          @x_max = x_max
          @y_min = y_min
          @y_max = y_max
        end

        def call
          GR.fillrect(@x_min, @x_max, @y_min, @y_max)
        end
      end

      class SetFillColorIndex
        def initialize(color_int)
          @color_int = color_int
        end

        def call
          GR.setfillcolorind(@color_int)
        end
      end

      class SetFillInteriorStyle
        def initialize(style)
          @style = style
        end

        def call
          GR.setfillintstyle(@style)
        end
      end

      class SetViewPort
        def initialize(x_min, x_max, y_min, y_max)
          @x_min = x_min
          @x_max = x_max
          @y_min = y_min
          @y_max = y_max
        end

        def call
          GR.setviewport(@x_min, @x_max, @y_min, @y_max)
        end
      end

      class SetWindow
        def initialize(x_min, x_max, y_min, y_max)
          @x_min = x_min
          @x_max = x_max
          @y_min = y_min
          @y_max = y_max
        end

        def call
          GR.setwindow(@x_min, @x_max, @y_min, @y_max)
        end
      end

      class SetLineWidth
        def initialize(width)
          @width = width
        end

        def call
          GR.setlinewidth(@width)
        end
      end

      class SetLineType
        def initialize(type)
          @type = type
        end

        def call
          GR.setlinetype(@type)
        end
      end

      class SetLineColorIndex
        def initialize(index)
          @index = index
        end

        def call
          GR.setlinecolorind(@index)
        end
      end

      class SetMarkerSize
        def initialize(size)
          @size = size
        end

        def call
          GR.setmarkersize(@size)
        end
      end

      class SetMarkerType
        def initialize(type)
          @type = type
        end

        def call
          GR.setmarkertype(@type)
        end
      end

      class SetMarkerColorIndex
        def initialize(index)
          @index = index
        end

        def call
          GR.setmarkercolorind(@index)
        end
      end

      class SetTextAlign
        def initialize(horizontal, vertical)
          @horizontal = horizontal
          @vertical = vertical
        end

        def call
          GR.settextalign(@horizontal, @vertical)
        end
      end

      class SetTextFontPrecision
        def initialize(font, precision)
          @font = font
          @precision = precision
        end

        def call
          GR.settextfontprec(@font, @precision)
        end
      end

      class SetCharHeight
        def initialize(height)
          @height = height
        end

        def call
          GR.setcharheight(@height)
        end
      end

      class Axes
        def initialize(x_major_tick, y_major_tick, x_origin, y_origin, major_x,
                       major_y, tick_size)
          @x_major_tick = x_major_tick
          @y_major_tick = y_major_tick
          @x_origin = x_origin
          @y_origin = y_origin
          @major_x = major_x
          @major_y = major_y
          @tick_size = tick_size
        end

        def call
          GR.axes(@x_major_tick, @y_major_tick, @x_origin, @y_origin, @major_x,
                  @major_y, @tick_size)
        end
      end

      class Grid
        def initialize(x_major_tick, y_major_tick, x_origin, y_origin, major_x,
                       major_y)
          @x_major_tick = x_major_tick
          @y_major_tick = y_major_tick
          @x_origin = x_origin
          @y_origin = y_origin
          @major_x = major_x
          @major_y = major_y
        end

        def call
          GR.grid(@x_major_tick, @y_major_tick, @x_origin, @y_origin, @major_x,
                  @major_y)
        end
      end

      class Text
        def initialize(x_loc, y_loc, text_string)
          @x_loc = x_loc
          @y_loc = y_loc
          @text_string = text_string
        end

        def call
          GR.text(@x_loc, @y_loc, @text_string)
        end
      end

      class DrawArc
        def initialize(x_min, x_max, y_min, y_max, starting_angle, ending_angle)
          @x_min = x_min
          @x_max = x_max
          @y_min = y_min
          @y_max = y_max
          @starting_angle = starting_angle
          @ending_angle = ending_angle
        end

        def call
          GR.drawarc(@x_min, @x_max, @y_min, @y_max, @starting_angle,
                     @ending_angle)
        end
      end

      class FillArc
        def initialize(x_min, x_max, y_min, y_max, starting_angle, ending_angle)
          @x_min = x_min
          @x_max = x_max
          @y_min = y_min
          @y_max = y_max
          @starting_angle = starting_angle
          @ending_angle = ending_angle
        end

        def call
          GR.fillarc(@x_min, @x_max, @y_min, @y_max, @starting_angle,
                     @ending_angle)
        end
      end

      # Will define color index, fonts, marker types and other constants
      # color index between 1 to 1256. map all prominent ones here
      CONTRASTING_COLORS = []
      COLOR_INDEX = {
        cloudy_blue: '#acc2d9',
        dark_pastel_green: '#56ae57',
        dust: '#b2996e',
        electric_lime: '#a8ff04',
        fresh_green: '#69d84f',
        light_eggplant: '#894585',
        nasty_green: '#70b23f',
        really_light_blue: '#d4ffff',
        tea: '#65ab7c',
        warm_purple: '#952e8f',
        yellowish_tan: '#fcfc81',
        cement: '#a5a391',
        dark_grass_green: '#388004',
        dusty_teal: '#4c9085',
        grey_teal: '#5e9b8a',
        macaroni_and_cheese: '#efb435',
        pinkish_tan: '#d99b82',
        spruce: '#0a5f38',
        strong_blue: '#0c06f7',
        toxic_green: '#61de2a',
        windows_blue: '#3778bf',
        blue_blue: '#2242c7',
        blue_with_a_hint_of_purple: '#533cc6',
        booger: '#9bb53c',
        bright_sea_green: '#05ffa6',
        dark_green_blue: '#1f6357',
        deep_turquoise: '#017374',
        green_teal: '#0cb577',
        strong_pink: '#ff0789',
        bland: '#afa88b',
        deep_aqua: '#08787f',
        lavender_pink: '#dd85d7',
        light_moss_green: '#a6c875',
        light_seafoam_green: '#a7ffb5',
        olive_yellow: '#c2b709',
        pig_pink: '#e78ea5',
        deep_lilac: '#966ebd',
        desert: '#ccad60',
        dusty_lavender: '#ac86a8',
        purpley_grey: '#947e94',
        purply: '#983fb2',
        candy_pink: '#ff63e9',
        light_pastel_green: '#b2fba5',
        boring_green: '#63b365',
        kiwi_green: '#8ee53f',
        light_grey_green: '#b7e1a1',
        orange_pink: '#ff6f52',
        tea_green: '#bdf8a3',
        very_light_brown: '#d3b683',
        egg_shell: '#fffcc4',
        eggplant_purple: '#430541',
        powder_pink: '#ffb2d0',
        reddish_grey: '#997570',
        baby_shit_brown: '#ad900d',
        liliac: '#c48efd',
        stormy_blue: '#507b9c',
        ugly_brown: '#7d7103',
        custard: '#fffd78',
        darkish_pink: '#da467d',
        deep_brown: '#410200',
        greenish_beige: '#c9d179',
        manilla: '#fffa86',
        off_blue: '#5684ae',
        battleship_grey: '#6b7c85',
        browny_green: '#6f6c0a',
        bruise: '#7e4071',
        kelley_green: '#009337',
        sickly_yellow: '#d0e429',
        sunny_yellow: '#fff917',
        azul: '#1d5dec',
        darkgreen: '#054907',
        lichen: '#8fb67b',
        light_light_green: '#c8ffb0',
        pale_gold: '#fdde6c',
        sun_yellow: '#ffdf22',
        tan_green: '#a9be70',
        burple: '#6832e3',
        butterscotch: '#fdb147',
        toupe: '#c7ac7d',
        dark_cream: '#fff39a',
        indian_red: '#850e04',
        light_lavendar: '#efc0fe',
        poison_green: '#40fd14',
        baby_puke_green: '#b6c406',
        bright_yellow_green: '#9dff00',
        charcoal_grey: '#3c4142',
        squash: '#f2ab15',
        cinnamon: '#ac4f06',
        light_pea_green: '#c4fe82',
        radioactive_green: '#2cfa1f',
        raw_sienna: '#9a6200',
        baby_purple: '#ca9bf7',
        cocoa: '#875f42',
        light_royal_blue: '#3a2efe',
        orangeish: '#fd8d49',
        rust_brown: '#8b3103',
        sand_brown: '#cba560',
        swamp: '#698339',
        tealish_green: '#0cdc73',
        burnt_siena: '#b75203',
        camo: '#7f8f4e',
        dusk_blue: '#26538d',
        fern: '#63a950',
        old_rose: '#c87f89',
        pale_light_green: '#b1fc99',
        peachy_pink: '#ff9a8a',
        rosy_pink: '#f6688e',
        light_bluish_green: '#76fda8',
        light_bright_green: '#53fe5c',
        light_neon_green: '#4efd54',
        light_seafoam: '#a0febf',
        tiffany_blue: '#7bf2da',
        washed_out_green: '#bcf5a6',
        browny_orange: '#ca6b02',
        nice_blue: '#107ab0',
        sapphire: '#2138ab',
        greyish_teal: '#719f91',
        orangey_yellow: '#fdb915',
        parchment: '#fefcaf',
        straw: '#fcf679',
        very_dark_brown: '#1d0200',
        terracota: '#cb6843',
        ugly_blue: '#31668a',
        clear_blue: '#247afd',
        creme: '#ffffb6',
        foam_green: '#90fda9',
        light_gold: '#fddc5c',
        seafoam_blue: '#78d1b6',
        topaz: '#13bbaf',
        violet_pink: '#fb5ffc',
        wintergreen: '#20f986',
        yellow_tan: '#ffe36e',
        dark_fuchsia: '#9d0759',
        indigo_blue: '#3a18b1',
        light_yellowish_green: '#c2ff89',
        pale_magenta: '#d767ad',
        rich_purple: '#720058',
        sunflower_yellow: '#ffda03',
        leather: '#ac7434',
        racing_green: '#014600',
        vivid_purple: '#9900fa',
        dark_royal_blue: '#02066f',
        hazel: '#8e7618',
        muted_pink: '#d1768f',
        booger_green: '#96b403',
        canary: '#fdff63',
        cool_grey: '#95a3a6',
        dark_taupe: '#7f684e',
        darkish_purple: '#751973',
        true_green: '#089404',
        coral_pink: '#ff6163',
        dark_sage: '#598556',
        dark_slate_blue: '#214761',
        flat_blue: '#3c73a8',
        mushroom: '#ba9e88',
        rich_blue: '#021bf9',
        dirty_purple: '#734a65',
        greenblue: '#23c48b',
        icky_green: '#8fae22',
        light_khaki: '#e6f2a2',
        warm_blue: '#4b57db',
        dark_hot_pink: '#d90166',
        deep_sea_blue: '#015482',
        carmine: '#9d0216',
        dark_yellow_green: '#728f02',
        pale_peach: '#ffe5ad',
        plum_purple: '#4e0550',
        golden_rod: '#f9bc08',
        neon_red: '#ff073a',
        old_pink: '#c77986',
        very_pale_blue: '#d6fffe',
        blood_orange: '#fe4b03',
        grapefruit: '#fd5956',
        sand_yellow: '#fce166',
        clay_brown: '#b2713d',
        dark_blue_grey: '#1f3b4d',
        flat_green: '#699d4c',
        light_green_blue: '#56fca2',
        warm_pink: '#fb5581',
        dodger_blue: '#3e82fc',
        gross_green: '#a0bf16',
        ice: '#d6fffa',
        metallic_blue: '#4f738e',
        pale_salmon: '#ffb19a',
        sap_green: '#5c8b15',
        algae: '#54ac68',
        bluey_grey: '#89a0b0',
        greeny_grey: '#7ea07a',
        highlighter_green: '#1bfc06',
        light_light_blue: '#cafffb',
        light_mint: '#b6ffbb',
        raw_umber: '#a75e09',
        vivid_blue: '#152eff',
        deep_lavender: '#8d5eb7',
        dull_teal: '#5f9e8f',
        light_greenish_blue: '#63f7b4',
        mud_green: '#606602',
        pinky: '#fc86aa',
        red_wine: '#8c0034',
        shit_green: '#758000',
        tan_brown: '#ab7e4c',
        darkblue: '#030764',
        rosa: '#fe86a4',
        lipstick: '#d5174e',
        pale_mauve: '#fed0fc',
        claret: '#680018',
        dandelion: '#fedf08',
        orangered: '#fe420f',
        poop_green: '#6f7c00',
        ruby: '#ca0147',
        dark: '#1b2431',
        greenish_turquoise: '#00fbb0',
        pastel_red: '#db5856',
        piss_yellow: '#ddd618',
        bright_cyan: '#41fdfe',
        dark_coral: '#cf524e',
        algae_green: '#21c36f',
        darkish_red: '#a90308',
        reddy_brown: '#6e1005',
        blush_pink: '#fe828c',
        camouflage_green: '#4b6113',
        lawn_green: '#4da409',
        putty: '#beae8a',
        vibrant_blue: '#0339f8',
        dark_sand: '#a88f59',
        saffron: '#feb209',
        twilight: '#4e518b',
        warm_brown: '#964e02',
        bluegrey: '#85a3b2',
        bubble_gum_pink: '#ff69af',
        duck_egg_blue: '#c3fbf4',
        greenish_cyan: '#2afeb7',
        petrol: '#005f6a',
        royal: '#0c1793',
        butter: '#ffff81',
        dusty_orange: '#f0833a',
        off_yellow: '#f1f33f',
        pale_olive_green: '#b1d27b',
        orangish: '#fc824a',
        leaf: '#71aa34',
        light_blue_grey: '#b7c9e2',
        dried_blood: '#4b0101',
        lightish_purple: '#a552e6',
        rusty_red: '#af2f0d',
        lavender_blue: '#8b88f8',
        light_grass_green: '#9af764',
        light_mint_green: '#a6fbb2',
        sunflower: '#ffc512',
        velvet: '#750851',
        brick_orange: '#c14a09',
        lightish_red: '#fe2f4a',
        pure_blue: '#0203e2',
        twilight_blue: '#0a437a',
        violet_red: '#a50055',
        yellowy_brown: '#ae8b0c',
        carnation: '#fd798f',
        muddy_yellow: '#bfac05',
        dark_seafoam_green: '#3eaf76',
        deep_rose: '#c74767',
        dusty_red: '#b9484e',
        lemon_lime: '#bffe28',
        brown_yellow: '#b29705',
        purple_brown: '#673a3f',
        wisteria: '#a87dc2',
        banana_yellow: '#fafe4b',
        lipstick_red: '#c0022f',
        water_blue: '#0e87cc',
        brown_grey: '#8d8468',
        vibrant_purple: '#ad03de',
        baby_green: '#8cff9e',
        barf_green: '#94ac02',
        eggshell_blue: '#c4fff7',
        sandy_yellow: '#fdee73',
        cool_green: '#33b864',
        pale: '#fff9d0',
        hot_magenta: '#f504c9',
        greyblue: '#77a1b5',
        purpley: '#8756e4',
        baby_shit_green: '#889717',
        brownish_pink: '#c27e79',
        dark_aquamarine: '#017371',
        diarrhea: '#9f8303',
        light_mustard: '#f7d560',
        pale_sky_blue: '#bdf6fe',
        turtle_green: '#75b84f',
        bright_olive: '#9cbb04',
        dark_grey_blue: '#29465b',
        greeny_brown: '#696006',
        lemon_green: '#adf802',
        light_periwinkle: '#c1c6fc',
        seaweed_green: '#35ad6b',
        sunshine_yellow: '#fffd37',
        ugly_purple: '#a442a0',
        medium_pink: '#f36196',
        puke_brown: '#947706',
        very_light_pink: '#fff4f2',
        viridian: '#1e9167',
        bile: '#b5c306',
        faded_yellow: '#feff7f',
        very_pale_green: '#cffdbc',
        vibrant_green: '#0add08',
        bright_lime: '#87fd05',
        spearmint: '#1ef876',
        light_aquamarine: '#7bfdc7',
        light_sage: '#bcecac',
        yellowgreen: '#bbf90f',
        baby_poo: '#ab9004',
        dark_seafoam: '#1fb57a',
        deep_teal: '#00555a',
        heather: '#a484ac',
        rust_orange: '#c45508',
        dirty_blue: '#3f829d',
        fern_green: '#548d44',
        bright_lilac: '#c95efb',
        weird_green: '#3ae57f',
        peacock_blue: '#016795',
        avocado_green: '#87a922',
        faded_orange: '#f0944d',
        grape_purple: '#5d1451',
        hot_green: '#25ff29',
        lime_yellow: '#d0fe1d',
        mango: '#ffa62b',
        shamrock: '#01b44c',
        bubblegum: '#ff6cb5',
        purplish_brown: '#6b4247',
        vomit_yellow: '#c7c10c',
        pale_cyan: '#b7fffa',
        key_lime: '#aeff6e',
        tomato_red: '#ec2d01',
        lightgreen: '#76ff7b',
        merlot: '#730039',
        night_blue: '#040348',
        purpleish_pink: '#df4ec8',
        apple: '#6ecb3c',
        baby_poop_green: '#8f9805',
        green_apple: '#5edc1f',
        heliotrope: '#d94ff5',
        almost_black: '#070d0d',
        cool_blue: '#4984b8',
        leafy_green: '#51b73b',
        mustard_brown: '#ac7e04',
        dusk: '#4e5481',
        dull_brown: '#876e4b',
        frog_green: '#58bc08',
        vivid_green: '#2fef10',
        bright_light_green: '#2dfe54',
        fluro_green: '#0aff02',
        kiwi: '#9cef43',
        seaweed: '#18d17b',
        navy_green: '#35530a',
        ultramarine_blue: '#1805db',
        iris: '#6258c4',
        pastel_orange: '#ff964f',
        yellowish_orange: '#ffab0f',
        perrywinkle: '#8f8ce7',
        tealish: '#24bca8',
        dark_plum: '#3f012c',
        pear: '#cbf85f',
        pinkish_orange: '#ff724c',
        midnight_purple: '#280137',
        light_urple: '#b36ff6',
        dark_mint: '#48c072',
        greenish_tan: '#bccb7a',
        light_burgundy: '#a8415b',
        turquoise_blue: '#06b1c4',
        ugly_pink: '#cd7584',
        sandy: '#f1da7a',
        electric_pink: '#ff0490',
        muted_purple: '#805b87',
        mid_green: '#50a747',
        greyish: '#a8a495',
        neon_yellow: '#cfff04',
        banana: '#ffff7e',
        carnation_pink: '#ff7fa7',
        tomato: '#ef4026',
        sea: '#3c9992',
        muddy_brown: '#886806',
        turquoise_green: '#04f489',
        buff: '#fef69e',
        fawn: '#cfaf7b',
        muted_blue: '#3b719f',
        pale_rose: '#fdc1c5',
        dark_mint_green: '#20c073',
        amethyst: '#9b5fc0',
        chestnut: '#742802',
        sick_green: '#9db92c',
        pea: '#a4bf20',
        rusty_orange: '#cd5909',
        stone: '#ada587',
        rose_red: '#be013c',
        pale_aqua: '#b8ffeb',
        deep_orange: '#dc4d01',
        earth: '#a2653e',
        mossy_green: '#638b27',
        grassy_green: '#419c03',
        pale_lime_green: '#b1ff65',
        light_grey_blue: '#9dbcd4',
        pale_grey: '#fdfdfe',
        asparagus: '#77ab56',
        blueberry: '#464196',
        purple_red: '#990147',
        pale_lime: '#befd73',
        greenish_teal: '#32bf84',
        caramel: '#af6f09',
        deep_magenta: '#a0025c',
        light_peach: '#ffd8b1',
        milk_chocolate: '#7f4e1e',
        ocher: '#bf9b0c',
        off_green: '#6ba353',
        purply_pink: '#f075e6',
        lightblue: '#7bc8f6',
        dusky_blue: '#475f94',
        golden: '#f5bf03',
        light_beige: '#fffeb6',
        butter_yellow: '#fffd74',
        dusky_purple: '#895b7b',
        french_blue: '#436bad',
        ugly_yellow: '#d0c101',
        greeny_yellow: '#c6f808',
        orangish_red: '#f43605',
        shamrock_green: '#02c14d',
        orangish_brown: '#b25f03',
        tree_green: '#2a7e19',
        deep_violet: '#490648',
        gunmetal: '#536267',
        cherry: '#cf0234',
        sandy_brown: '#c4a661',
        warm_grey: '#978a84',
        dark_indigo: '#1f0954',
        midnight: '#03012d',
        bluey_green: '#2bb179',
        grey_pink: '#c3909b',
        soft_purple: '#a66fb5',
        blood: '#770001',
        brown_red: '#922b05',
        medium_grey: '#7d7f7c',
        berry: '#990f4b',
        poo: '#8f7303',
        purpley_pink: '#c83cb9',
        light_salmon: '#fea993',
        snot: '#acbb0d',
        easter_purple: '#c071fe',
        light_yellow_green: '#ccfd7f',
        dark_navy_blue: '#00022e',
        drab: '#828344',
        light_rose: '#ffc5cb',
        rouge: '#ab1239',
        purplish_red: '#b0054b',
        slime_green: '#99cc04',
        baby_poop: '#937c00',
        irish_green: '#019529',
        dark_navy: '#000435',
        greeny_blue: '#42b395',
        light_plum: '#9d5783',
        pinkish_grey: '#c8aca9',
        dirty_orange: '#c87606',
        rust_red: '#aa2704',
        pale_lilac: '#e4cbff',
        orangey_red: '#fa4224',
        primary_blue: '#0804f9',
        kermit_green: '#5cb200',
        brownish_purple: '#76424e',
        murky_green: '#6c7a0e',
        wheat: '#fbdd7e',
        very_dark_purple: '#2a0134',
        bottle_green: '#044a05',
        watermelon: '#fd4659',
        deep_sky_blue: '#0d75f8',
        fire_engine_red: '#fe0002',
        yellow_ochre: '#cb9d06',
        pumpkin_orange: '#fb7d07',
        pale_olive: '#b9cc81',
        light_lilac: '#edc8ff',
        lightish_green: '#61e160',
        carolina_blue: '#8ab8fe',
        mulberry: '#920a4e',
        shocking_pink: '#fe02a2',
        auburn: '#9a3001',
        bright_lime_green: '#65fe08',
        celadon: '#befdb7',
        pinkish_brown: '#b17261',
        poo_brown: '#885f01',
        bright_sky_blue: '#02ccfe',
        celery: '#c1fd95',
        dirt_brown: '#836539',
        strawberry: '#fb2943',
        dark_lime: '#84b701',
        copper: '#b66325',
        medium_brown: '#7f5112',
        muted_green: '#5fa052',
        robins_egg: '#6dedfd',
        bright_aqua: '#0bf9ea',
        bright_lavender: '#c760ff',
        ivory: '#ffffcb',
        very_light_purple: '#f6cefc',
        light_navy: '#155084',
        pink_red: '#f5054f',
        olive_brown: '#645403',
        poop_brown: '#7a5901',
        mustard_green: '#a8b504',
        ocean_green: '#3d9973',
        very_dark_blue: '#000133',
        dusty_green: '#76a973',
        light_navy_blue: '#2e5a88',
        minty_green: '#0bf77d',
        adobe: '#bd6c48',
        barney: '#ac1db8',
        jade_green: '#2baf6a',
        bright_light_blue: '#26f7fd',
        light_lime: '#aefd6c',
        dark_khaki: '#9b8f55',
        orange_yellow: '#ffad01',
        ocre: '#c69c04',
        maize: '#f4d054',
        faded_pink: '#de9dac',
        british_racing_green: '#05480d',
        sandstone: '#c9ae74',
        mud_brown: '#60460f',
        light_sea_green: '#98f6b0',
        robin_egg_blue: '#8af1fe',
        aqua_marine: '#2ee8bb',
        dark_sea_green: '#11875d',
        soft_pink: '#fdb0c0',
        orangey_brown: '#b16002',
        cherry_red: '#f7022a',
        burnt_yellow: '#d5ab09',
        brownish_grey: '#86775f',
        camel: '#c69f59',
        purplish_grey: '#7a687f',
        marine: '#042e60',
        greyish_pink: '#c88d94',
        pale_turquoise: '#a5fbd5',
        pastel_yellow: '#fffe71',
        bluey_purple: '#6241c7',
        canary_yellow: '#fffe40',
        faded_red: '#d3494e',
        sepia: '#985e2b',
        coffee: '#a6814c',
        bright_magenta: '#ff08e8',
        mocha: '#9d7651',
        ecru: '#feffca',
        purpleish: '#98568d',
        cranberry: '#9e003a',
        darkish_green: '#287c37',
        brown_orange: '#b96902',
        dusky_rose: '#ba6873',
        melon: '#ff7855',
        sickly_green: '#94b21c',
        silver: '#c5c9c7',
        purply_blue: '#661aee',
        purpleish_blue: '#6140ef',
        hospital_green: '#9be5aa',
        shit_brown: '#7b5804',
        mid_blue: '#276ab3',
        amber: '#feb308',
        easter_green: '#8cfd7e',
        soft_blue: '#6488ea',
        cerulean_blue: '#056eee',
        golden_brown: '#b27a01',
        bright_turquoise: '#0ffef9',
        red_pink: '#fa2a55',
        red_purple: '#820747',
        greyish_brown: '#7a6a4f',
        vermillion: '#f4320c',
        russet: '#a13905',
        steel_grey: '#6f828a',
        lighter_purple: '#a55af4',
        bright_violet: '#ad0afd',
        prussian_blue: '#004577',
        slate_green: '#658d6d',
        dirty_pink: '#ca7b80',
        dark_blue_green: '#005249',
        pine: '#2b5d34',
        yellowy_green: '#bff128',
        dark_gold: '#b59410',
        bluish: '#2976bb',
        darkish_blue: '#014182',
        dull_red: '#bb3f3f',
        pinky_red: '#fc2647',
        bronze: '#a87900',
        pale_teal: '#82cbb2',
        military_green: '#667c3e',
        barbie_pink: '#fe46a5',
        bubblegum_pink: '#fe83cc',
        pea_soup_green: '#94a617',
        dark_mustard: '#a88905',
        shit: '#7f5f00',
        medium_purple: '#9e43a2',
        very_dark_green: '#062e03',
        dirt: '#8a6e45',
        dusky_pink: '#cc7a8b',
        red_violet: '#9e0168',
        lemon_yellow: '#fdff38',
        pistachio: '#c0fa8b',
        dull_yellow: '#eedc5b',
        dark_lime_green: '#7ebd01',
        denim_blue: '#3b5b92',
        teal_blue: '#01889f',
        lightish_blue: '#3d7afd',
        purpley_blue: '#5f34e7',
        light_indigo: '#6d5acf',
        swamp_green: '#748500',
        brown_green: '#706c11',
        dark_maroon: '#3c0008',
        hot_purple: '#cb00f5',
        dark_forest_green: '#002d04',
        faded_blue: '#658cbb',
        drab_green: '#749551',
        light_lime_green: '#b9ff66',
        snot_green: '#9dc100',
        yellowish: '#faee66',
        light_blue_green: '#7efbb3',
        bordeaux: '#7b002c',
        light_mauve: '#c292a1',
        ocean: '#017b92',
        marigold: '#fcc006',
        muddy_green: '#657432',
        dull_orange: '#d8863b',
        steel: '#738595',
        electric_purple: '#aa23ff',
        fluorescent_green: '#08ff08',
        yellowish_brown: '#9b7a01',
        blush: '#f29e8e',
        soft_green: '#6fc276',
        bright_orange: '#ff5b00',
        lemon: '#fdff52',
        purple_grey: '#866f85',
        acid_green: '#8ffe09',
        pale_lavender: '#eecffe',
        violet_blue: '#510ac9',
        light_forest_green: '#4f9153',
        burnt_red: '#9f2305',
        khaki_green: '#728639',
        cerise: '#de0c62',
        faded_purple: '#916e99',
        apricot: '#ffb16d',
        dark_olive_green: '#3c4d03',
        grey_brown: '#7f7053',
        green_grey: '#77926f',
        true_blue: '#010fcc',
        pale_violet: '#ceaefa',
        periwinkle_blue: '#8f99fb',
        light_sky_blue: '#c6fcff',
        blurple: '#5539cc',
        green_brown: '#544e03',
        bluegreen: '#017a79',
        bright_teal: '#01f9c6',
        brownish_yellow: '#c9b003',
        pea_soup: '#929901',
        forest: '#0b5509',
        barney_purple: '#a00498',
        ultramarine: '#2000b1',
        purplish: '#94568c',
        puke_yellow: '#c2be0e',
        bluish_grey: '#748b97',
        dark_periwinkle: '#665fd1',
        dark_lilac: '#9c6da5',
        reddish: '#c44240',
        light_maroon: '#a24857',
        dusty_purple: '#825f87',
        terra_cotta: '#c9643b',
        avocado: '#90b134',
        marine_blue: '#01386a',
        teal_green: '#25a36f',
        slate_grey: '#59656d',
        lighter_green: '#75fd63',
        electric_green: '#21fc0d',
        dusty_blue: '#5a86ad',
        golden_yellow: '#fec615',
        bright_yellow: '#fffd01',
        light_lavender: '#dfc5fe',
        umber: '#b26400',
        poop: '#7f5e00',
        dark_peach: '#de7e5d',
        jungle_green: '#048243',
        eggshell: '#ffffd4',
        denim: '#3b638c',
        yellow_brown: '#b79400',
        dull_purple: '#84597e',
        chocolate_brown: '#411900',
        wine_red: '#7b0323',
        neon_blue: '#04d9ff',
        dirty_green: '#667e2c',
        light_tan: '#fbeeac',
        ice_blue: '#d7fffe',
        cadet_blue: '#4e7496',
        dark_mauve: '#874c62',
        very_light_blue: '#d5ffff',
        grey_purple: '#826d8c',
        pastel_pink: '#ffbacd',
        very_light_green: '#d1ffbd',
        dark_sky_blue: '#448ee4',
        evergreen: '#05472a',
        dull_pink: '#d5869d',
        aubergine: '#3d0734',
        mahogany: '#4a0100',
        reddish_orange: '#f8481c',
        deep_green: '#02590f',
        vomit_green: '#89a203',
        purple_pink: '#e03fd8',
        dusty_pink: '#d58a94',
        faded_green: '#7bb274',
        camo_green: '#526525',
        pinky_purple: '#c94cbe',
        pink_purple: '#db4bda',
        brownish_red: '#9e3623',
        dark_rose: '#b5485d',
        mud: '#735c12',
        brownish: '#9c6d57',
        emerald_green: '#028f1e',
        pale_brown: '#b1916e',
        dull_blue: '#49759c',
        burnt_umber: '#a0450e',
        medium_green: '#39ad48',
        clay: '#b66a50',
        light_aqua: '#8cffdb',
        light_olive_green: '#a4be5c',
        brownish_orange: '#cb7723',
        dark_aqua: '#05696b',
        purplish_pink: '#ce5dae',
        dark_salmon: '#c85a53',
        greenish_grey: '#96ae8d',
        jade: '#1fa774',
        ugly_green: '#7a9703',
        dark_beige: '#ac9362',
        emerald: '#01a049',
        pale_red: '#d9544d',
        light_magenta: '#fa5ff7',
        sky: '#82cafc',
        light_cyan: '#acfffc',
        yellow_orange: '#fcb001',
        reddish_purple: '#910951',
        reddish_pink: '#fe2c54',
        orchid: '#c875c4',
        dirty_yellow: '#cdc50a',
        orange_red: '#fd411e',
        deep_red: '#9a0200',
        orange_brown: '#be6400',
        cobalt_blue: '#030aa7',
        neon_pink: '#fe019a',
        rose_pink: '#f7879a',
        greyish_purple: '#887191',
        raspberry: '#b00149',
        aqua_green: '#12e193',
        salmon_pink: '#fe7b7c',
        tangerine: '#ff9408',
        brownish_green: '#6a6e09',
        red_brown: '#8b2e16',
        greenish_brown: '#696112',
        pumpkin: '#e17701',
        pine_green: '#0a481e',
        charcoal: '#343837',
        baby_pink: '#ffb7ce',
        cornflower: '#6a79f7',
        blue_violet: '#5d06e9',
        chocolate: '#3d1c02',
        greyish_green: '#82a67d',
        scarlet: '#be0119',
        green_yellow: '#c9ff27',
        dark_olive: '#373e02',
        sienna: '#a9561e',
        pastel_purple: '#caa0ff',
        terracotta: '#ca6641',
        aqua_blue: '#02d8e9',
        sage_green: '#88b378',
        blood_red: '#980002',
        deep_pink: '#cb0162',
        grass: '#5cac2d',
        moss: '#769958',
        pastel_blue: '#a2bffe',
        bluish_green: '#10a674',
        green_blue: '#06b48b',
        dark_tan: '#af884a',
        greenish_blue: '#0b8b87',
        pale_orange: '#ffa756',
        vomit: '#a2a415',
        forrest_green: '#154406',
        dark_lavender: '#856798',
        dark_violet: '#34013f',
        purple_blue: '#632de9',
        dark_cyan: '#0a888a',
        olive_drab: '#6f7632',
        pinkish: '#d46a7e',
        cobalt: '#1e488f',
        neon_purple: '#bc13fe',
        light_turquoise: '#7ef4cc',
        apple_green: '#76cd26',
        dull_green: '#74a662',
        wine: '#80013f',
        powder_blue: '#b1d1fc',
        off_white: '#ffffe4',
        electric_blue: '#0652ff',
        dark_turquoise: '#045c5a',
        blue_purple: '#5729ce',
        azure: '#069af3',
        bright_red: '#ff000d',
        pinkish_red: '#f10c45',
        cornflower_blue: '#5170d7',
        light_olive: '#acbf69',
        grape: '#6c3461',
        greyish_blue: '#5e819d',
        purplish_blue: '#601ef9',
        yellowish_green: '#b0dd16',
        greenish_yellow: '#cdfd02',
        medium_blue: '#2c6fbb',
        dusty_rose: '#c0737a',
        light_violet: '#d6b4fc',
        midnight_blue: '#020035',
        bluish_purple: '#703be7',
        red_orange: '#fd3c06',
        dark_magenta: '#960056',
        greenish: '#40a368',
        ocean_blue: '#03719c',
        coral: '#fc5a50',
        cream: '#ffffc2',
        reddish_brown: '#7f2b0a',
        burnt_sienna: '#b04e0f',
        brick: '#a03623',
        sage: '#87ae73',
        grey_green: '#789b73',
        white: '#ffffff',
        robins_egg_blue: '#98eff9',
        moss_green: '#658b38',
        steel_blue: '#5a7d9a',
        eggplant: '#380835',
        light_yellow: '#fffe7a',
        leaf_green: '#5ca904',
        light_grey: '#d8dcd6',
        puke: '#a5a502',
        pinkish_purple: '#d648d7',
        sea_blue: '#047495',
        pale_purple: '#b790d4',
        slate_blue: '#5b7c99',
        blue_grey: '#607c8e',
        hunter_green: '#0b4008',
        fuchsia: '#ed0dd9',
        crimson: '#8c000f',
        pale_yellow: '#ffff84',
        ochre: '#bf9005',
        mustard_yellow: '#d2bd0a',
        light_red: '#ff474c',
        cerulean: '#0485d1',
        pale_pink: '#ffcfdc',
        deep_blue: '#040273',
        rust: '#a83c09',
        light_teal: '#90e4c1',
        slate: '#516572',
        goldenrod: '#fac205',
        dark_yellow: '#d5b60a',
        dark_grey: '#363737',
        army_green: '#4b5d16',
        grey_blue: '#6b8ba4',
        seafoam: '#80f9ad',
        puce: '#a57e52',
        spring_green: '#a9f971',
        dark_orange: '#c65102',
        sand: '#e2ca76',
        pastel_green: '#b0ff9d',
        mint: '#9ffeb0',
        light_orange: '#fdaa48',
        bright_pink: '#fe01b1',
        chartreuse: '#c1f80a',
        deep_purple: '#36013f',
        dark_brown: '#341c02',
        taupe: '#b9a281',
        pea_green: '#8eab12',
        puke_green: '#9aae07',
        kelly_green: '#02ab2e',
        seafoam_green: '#7af9ab',
        blue_green: '#137e6d',
        khaki: '#aaa662',
        burgundy: '#610023',
        dark_teal: '#014d4e',
        brick_red: '#8f1402',
        royal_purple: '#4b006e',
        plum: '#580f41',
        mint_green: '#8fff9f',
        gold: '#dbb40c',
        baby_blue: '#a2cffe',
        yellow_green: '#c0fb2d',
        bright_purple: '#be03fd',
        dark_red: '#840000',
        pale_blue: '#d0fefe',
        grass_green: '#3f9b0b',
        navy: '#01153e',
        aquamarine: '#04d8b2',
        burnt_orange: '#c04e01',
        neon_green: '#0cff0c',
        bright_blue: '#0165fc',
        rose: '#cf6275',
        light_pink: '#ffd1df',
        mustard: '#ceb301',
        indigo: '#380282',
        lime: '#aaff32',
        sea_green: '#53fca1',
        periwinkle: '#8e82fe',
        dark_pink: '#cb416b',
        olive_green: '#677a04',
        peach: '#ffb07c',
        pale_green: '#c7fdb5',
        light_brown: '#ad8150',
        hot_pink: '#ff028d',
        black: '#000000',
        lilac: '#cea2fd',
        navy_blue: '#001146',
        royal_blue: '#0504aa',
        beige: '#e6daa6',
        salmon: '#ff796c',
        olive: '#6e750e',
        maroon: '#650021',
        bright_green: '#01ff07',
        dark_purple: '#35063e',
        mauve: '#ae7181',
        forest_green: '#06470c',
        aqua: '#13eac9',
        cyan: '#00ffff',
        tan: '#d1b26f',
        dark_blue: '#00035b',
        lavender: '#c79fef',
        turquoise: '#06c2ac',
        dark_green: '#033500',
        violet: '#9a0eea',
        light_purple: '#bf77f6',
        lime_green: '#89fe05',
        grey: '#929591',
        sky_blue: '#75bbfd',
        yellow: '#ffff14',
        magenta: '#c20078',
        light_green: '#96f97b',
        orange: '#f97306',
        teal: '#029386',
        light_blue: '#95d0fc',
        red: '#e50000',
        brown: '#653700',
        pink: '#ff81c0',
        blue: '#0343df',
        green: '#15b01a',
        purple: '#7e1e9c'
      }.freeze
      GR_FONTS = {
        times_roman: 101,
        times_italic: 102,
        times_bold: 103,
        times_bold_italic: 104,
        helvetica: 105,
        helvetica_oblique: 106,
        helvetica_bold: 107,
        helvetica_bold_oblique: 108,
        courier: 109,
        courier_oblique: 110,
        courier_bold: 111,
        courier_bold_oblique: 112,
        symbol: 113,
        bookman_light: 114,
        bookman_light_italic: 115,
        bookman_demi: 116,
        bookman_demi_italic: 117,
        newcenturyschlbk_roman: 118,
        newcenturyschlbk_italic: 119,
        newcenturyschlbk_bold: 120,
        newcenturyschlbk_bold_italic: 121,
        avantgarde_book: 122,
        avantgarde_book_oblique: 123,
        avantgarde_demi: 124,
        avantgarde_demi_oblique: 125,
        palatino_roman: 126,
        palatino_italic: 127,
        palatino_bold: 128,
        palatino_bold_italic: 129,
        zapfchancery_medium_italic: 130,
        zapfdingbats: 131
      }.freeze

      GR_FONT_PRECISION = {
        text_precision_string: 0,
        text_precision_char: 1,
        text_precision_stroke: 2
      }.freeze

      # Marker types
      GR_MARKER_SHAPES = {
        dot: 1,
        plus: 2,
        asterisk: 3,
        circle: 4,
        diagonal_cross: 5,
        solid_circle: -1,
        triangle_up: -2,
        solid_tri_up: -3,
        triangle_down: -4,
        solid_tri_down: -5,
        square: -6,
        solid_square: -7,
        bowtie: -8,
        solid_bowtie: -9,
        hglass: -10,
        solid_hglass: -11,
        diamond: -12,
        solid_diamond: -13,
        star: -14,
        solid_star: -15,
        tri_up_down: -16,
        solid_tri_right: -17,
        solid_tri_left: -18,
        hollow_plus: -19,
        solid_plus: -20,
        pentagon: -21,
        hexagon: -22,
        heptagon: -23,
        octagon: -24,
        star_4: -25,
        star_5: -26,
        star_6: -27,
        star_7: -28,
        star_8: -29,
        vline: -30,
        hline: -31,
        omark: -32
      }.freeze

      GR_LINE_TYPES = {
        solid: 1,
        dashed: 2,
        dotted: 3,
        dashed_dotted: 4,
        dash_2_dot: -1,
        dash_3_dot: -2,
        long_dash: -3,
        long_short_dash: -4,
        spaced_dash: -5,
        spaced_dot: -6,
        double_dot: -7,
        triple_dot: -8
      }.freeze

      GR_FILL_INTERIOR_STYLES = {
        hollow: 0,
        solid: 1,
        pattern: 2,
        hatch: 3
      }.freeze
    end
  end
end
