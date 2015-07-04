Some Fine TV
============

The code behind [somefine.tv](http://somefine.tv).

Usage
-----

This uses [Middleman](http://middlemanapp.com) to build the static HTML, which depends on Ruby and Bundler. Getting those set up is an exercise for the reader.

* To get set up with all the dependencies: `bundle`
* Once done, `bundle exec middleman` to start a local Middleman server. Visit [localhost:4567](http://localhost:4567) to see the site in action.

Adding Episodes
---------------

Episode numbers start with 001 and increment upward.

* Add the new episode to `source/episodes/` with the filename `NNN.markdown`.
    * The `date`, `excerpt`, and `title` attributes are required in the [YAML front matter](https://middlemanapp.com/basics/frontmatter/). Optionally, fill in the `shows` array for later indexing.
* Add the episode's audio to `source/files/NNN.m4a`.
