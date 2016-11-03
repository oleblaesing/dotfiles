module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 21,

    // font family with optional fallbacks
    fontFamily: '"Roboto Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#B3B8C3',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'UNDERLINE',

    // color of the text
    foregroundColor: '#C2C8D7',

    // terminal background color
    backgroundColor: '#1C262B',

    // border color (window, tabs)
    borderColor: '#555',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#EE2B2A',
      green: '#40A33F',
      yellow: '#FFEA2E',
      blue: '#1E80F0',
      magenta: '#8800A0',
      cyan: '#16AFCA',
      white: '#A4A4A4',
      lightBlack: '#777777',
      lightRed: '#DC5C60',
      lightGreen: '#70BE71',
      lightYellow: '#FFF163',
      lightBlue: '#54A4F3',
      lightMagenta: '#AA4DBC',
      lightCyan: '#42C7DA',
      lightWhite: '#FFFFFF'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
