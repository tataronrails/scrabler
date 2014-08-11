require 'open-uri'
require 'spreadsheet'

class WodsController < ApplicationController

  def index
  end

  def create_xls
    send_xls()
  end

private

  def send_xls
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet
    @parser = PageParser.new params[:uri_path]
    sheet[0,0] = @parser.get_date
    sheet[0,1] = @parser.get_rest_data
    sheet.column(0).width = @parser.get_date.to_s.length
    sheet.column(1).width = @parser.get_rest_data.to_s.length
    book.write file_path
    send_file file_path
  end

  def file_path
    "public/outputs_excel_file.xls"
  end
end
