
class PageParser

  def initialize uri=nil
    @uri = uri.nil? ? "http://www.crossfitverve.com/tuesday-140722/" : uri
    @initial_page = Nokogiri::HTML(open(@uri))
  end

  def get_date
    if @uri =~ /crossfitverve.com/
      date_str = @initial_page.css('div.post-info span')[0]['title']
      return DateTime.iso8601(date_str)
    elsif @uri =~ /outlawcrossfit.com/
      date_str = @initial_page.css('div.entry-meta time')[0]['datetime']
      return DateTime.iso8601(date_str)
    else
      return nil
    end
  end

  def get_rest_data
    if @uri =~ /crossfitverve.com/
      return @initial_page.css('div.entry-content p')[0].css('strong span').text.gsub(/\n/, " ")
    elsif @uri =~ /outlawcrossfit.com/
      str = ""
      el = @initial_page.css('div.entry-content p')
      begin_add_to_str = false
      el.each do |e|
        if e.text =~ /Conditioning/
          begin_add_to_str = true
          next
        end
        str << " #{e.text}" if begin_add_to_str
      end
      return str
    else
      return nil
    end
  end
end
