require 'nokogiri'

@xmldoc = <<END
<doc>
  <albums>
	<album>
		<artist>Michael Jackson</artist>
		<title>Bad</title>
		<year>1987</year>
	</album>
	<album>
		<artist>Prince</artist>
		<title>Purple Rain</title>
		<year>1983</year>
	</album>
	<album>
		<artist>Madonna</artist>
		<title>True Blue</title>
		<year>1986</year>
	</album>
  </albums>
</doc>
END


doc = Nokogiri::XML::Document.parse(@xmldoc)
albums = doc.xpath("/doc/albums/album")
titles = albums.collect do |album| 
           album.xpath("*").inject({}) {|result, element| result.merge!("#{element.name}"=>"#{element.text()}")}
         end
p titles