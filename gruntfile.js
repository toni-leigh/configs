module.exports = function (grunt) {
  'use strict';

  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-autoprefixer');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Sass
    sass: {
      options: {
        sourceMap: false, // Create source map
        outputStyle: 'expanded' // Minify output
      },
      dist: {
        files: [
          {
            expand: true, // Recursive
            cwd: "sass", // The startup directory
            src: [
              "**/*.scss"
            ], // Source files
            dest: "", // Destination
            ext: ".css" // File extension
          }
        ]
      }
    },

    // Concat JS
    concat: {
      options: {
        separator: ';',
      },
      dist: {
        src: [
          'js/*.js'
        ],
        dest: 'frontend.concat.js'
      },
    },

    // Uglify JS
    uglify: {
      options: {
        compress: {
          drop_console: true
        }
      },
      dist: {
        files: {
          'frontend.min.js': ['frontend.concat.js']
        }
      }
    },

    // Autoprefixer
    autoprefixer: {
      options: {
        browsers: [
          'last 2 versions'
        ],
        map: true // Update source map (creates one if it can't find an existing map)
      },

      // Prefix all files
      multiple_files: {
        src: '*.css'
      },
    },

    // Watch
    watch: {
      css: {
        files: [
          'sass/**/*.scss'
        ],
        tasks: [
          'sass',
          'autoprefixer'
        ],
        options: {
          spawn: false
        }
      },
      js: {
        files: [
          'js/*.js'
        ],
        tasks: [
          'concat',
          'uglify'
        ]
      }
    }
  });

  grunt.registerTask('default', ['sass','autoprefixer','concat','uglify','watch']);
};
