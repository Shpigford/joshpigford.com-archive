xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Josh Pigford"
    xml.description "The weblog of webmaster and professional interneter, Josh Pigford"
    xml.link root_url

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description markdown(article.body)
        xml.pubDate article.publish_at.to_s(:rfc822)
        xml.link article_url(article.slug)
        xml.guid article_url(article.slug)
      end
    end
  end
end