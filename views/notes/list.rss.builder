xml.instruct!
xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title "Ken Erickson's Notes"
    xml.description "Bookworm on everything."
    xml.link 'http://notes.kerickson.me'

    for note in @notes
      xml.item do
        xml.title note.title
        xml.description note.body
        xml.pubDate note.created_at.to_s(:rfc822)
        xml.link url(:notes, :show, :slug => note.slug)
      end
    end
  end
end