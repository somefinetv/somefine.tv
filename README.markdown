Some Fine TV
=======================

The code behind [somefine.tv](http://somefine.tv).

Setup
-----

This uses [Eleventy](https://www.11ty.dev) to build static HTML, so you'll need Node and Yarn to get started. Then `yarn install` should get you going. It optionally uses Make to perform the various common commands.

Usage
-----

It has a Makefile with wrappers around Eleventy commands:

* `make` to build the site
* `make serve` to run a local live server
* `make clean` to delete the built files
Adding Episodes
---------------

Episode numbers start with 001 and increment upward.

* Add the new episode to `source/episodes/` with the filename `NNN.markdown`.
    * The `date`, `excerpt`, and `title` attributes are required in the [YAML front matter](https://middlemanapp.com/basics/frontmatter/). Optionally, fill in the `shows` array for later indexing.
* Upload the episode's audio to `s3://somefine-tv/episodes/NNN.m4a`.
