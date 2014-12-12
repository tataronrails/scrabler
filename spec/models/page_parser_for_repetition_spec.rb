require 'spec_helper'

describe PageParserForRepetition do
  before :all do
    file_path = File.expand_path('../test_data/lenta_ru.html', File.dirname(__FILE__))
    @page_parser = PageParserForRepetition.new open(file_path)
  end

  it ".get_repetition_classes" do
    result = @page_parser.get_repetition_classes
    result.class.should == Hash
    result.count.should == 2
  end

end
