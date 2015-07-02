require "pathname"

xml.instruct! :xml, version: "1.0"
xml.rss(
  version: 2.0,
  "xmlns:atom" => "http://www.w3.org/2005/Atom",
  "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",
) do
  xml.channel do
    xml.link site_url
    xml.title site_name
    xml.description "Discussions of the fine TV availble to us today."
    xml.tag! "atom:link", rel: "self", type: "application/rss+xml", href: current_page.url
    xml.pubDate rfc822_timestamp(episodes.map { |e| e.data.date }.max)
    xml.lastBuildDate rfc822_timestamp(Time.now)
    xml.language "en-us"

    xml.tag! "itunes:author", "Patrick Byrne and Samuel Fine"
    xml.tag! "itunes:summary", "Discussions of the fine TV availble to us today."
    xml.tag! "itunes:category", text: "TV & Film"
    xml.tag! "itunes:explicit", "clean"
    xml.tag! "itunes:image", href: full_url(image_path("podcast-cover.png"))

    episodes.each do |episode|
      xml.item do
        xml.title "#{episode_number(episode)}: #{episode.data.title}"
        xml.description episode.render(layout: false)
        xml.pubDate rfc822_timestamp(episode.data.date)
        xml.link full_url(episode.url)
        xml.guid full_url(episode.url), isPermaLink: true
        Array(episode.data.shows).each do |show|
          xml.category show
        end
        xml.enclosure({
          url: full_url(path_to_audio(episode)),
          length: Pathname.new("source/#{path_to_audio(episode)}").size,
          type: "audio/mp4",
        })

        xml.tag! "itunes:summary", episode.render(layout: false)
        if episode.data.explicit
          xml.tag! "itunes:explicit", "yes"
        end
      end
    end
  end
end

