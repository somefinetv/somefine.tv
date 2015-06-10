xml.instruct! :xml, version: "1.0"
xml.rss(version: 2.0, "xmlns:atom" => "http://www.w3.org/2005/Atom") do
  xml.channel do
    xml.link site_url
    xml.title site_name
    xml.description "Show and tell for designers."
    xml.tag! "atom:link", rel: "self", type: "application/rss+xml", href: full_url(current_page.url)
    xml.pubDate rfc822_timestamp(episodes.map { |e| e.data.date }.max)
    xml.lastBuildDate rfc822_timestamp(Time.now)

    episodes.each do |episode|
      xml.item do
        xml.title episode.data.title
        xml.description episode.render(layout: false)
        xml.pubDate rfc822_timestamp(episode.data.date)
        xml.link full_url(episode.url)
        xml.guid full_url(episode.url), isPermaLink: true
        Array(episode.data.shows).each do |show|
          xml.category show
        end
      end
    end
  end
end

