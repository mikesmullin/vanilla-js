module.exports = function (grunt) {

    'use strict';

    var pkg = require('./package.json');

    grunt.initConfig({

        coffee: [{
            expand: true,
            flatten: true,
            cwd: 'coffee',
            src: ['*.coffee'],
            dest: 'js',
            ext: '.js'
        }]
    });

    // load plugins
    grunt.loadNpmTasks('grunt-contrib-coffee');

    // define tasks
    grunt.registerTask('default', ['coffee']);

};
