module.exports = function(eleventyConfig) {
  eleventyConfig.addPassthroughCopy("./source/images/")

  eleventyConfig.addWatchTarget("./source/stylesheets/")

  const episodePath = /\/episodes\//
  eleventyConfig.addCollection("episodes", (collectionApi) => {
    // TODO use glob search instead of regex
    return collectionApi.getAllSorted().filter((item) => {
      return item.inputPath.match(episodePath) && !item.data.hidden
    })
  })

  return {
    dir: { input: "source", output: "_site" }
  };
};

