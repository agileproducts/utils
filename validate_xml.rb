#! /usr/bin/env ruby
# encoding: UTF-8

require 'nokogiri'

if ARGV[0].nil? || ARGV[1].nil?
  puts "Usage: validate_xml.rb [xmlfile] [schema]"
  exit 1
end

doc = Nokogiri::XML(File.read(ARGV[0]))
schema = Nokogiri::XML::Schema(File.read(ARGV[1]))

validation_errors = []

#checks for well_formedness
doc.errors.each { |error| validation_errors.push error}

#checks valid vs schema
schema.validate(doc).each { |error| validation_errors.push error}

validation_errors.each {|error| puts error }