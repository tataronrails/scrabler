class PageParserForRepetition

  attr_reader :result

  def initialize uri
    @page = Nokogiri::HTML open(uri)
    @result = {}
  end

  def get_repetition_classes
    class_arr = []
    @page.css('[class]').each do |e|
      class_arr << e['class'] if !e.text.blank? && e.children.count > 1
    end
    class_arr.uniq!
    puts class_arr
    get_repetition_parents class_arr
  end

  def get_repetition_parents array_of_child_class_names
    arr = {}
    array_of_child_class_names.each do |e|
      parent = @page.css("[class='#{e}']")[0].parent
      arr[(array_of_child_class_names.index(e)+1).to_s] = [ @page.css("[#{e}]")[0].parent, parent.children ]
    end
    @result = arr[0..4]
  end

end
