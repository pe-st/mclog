# encoding: utf-8

require "logstash/devutils/rspec/spec_helper"
require "logstash/filters/multiline"
require "logstash/filters/grok"
require "logstash/filters/date"
require "logstash/filters/mutate"

describe "logstash filters" do

  describe "mac install.log" do
    config File.open("conf/5_install_log_filter.conf", "rb").read
    sample File.open("samples/mac_install_log.log", { encoding: "UTF-8" } ).lines.
    map { |line| { "type" => "install_log_type", "message" => line } } do
      # TODO: test record count
      puts "============================================================"
      subject.each_index do |i|
        # TODO: test all fields
        puts "Timestamp: #{subject[i]["@timestamp"]}"
        puts "Message Timestamp: #{subject[i]["timestamp"]}"
        puts "Host: #{subject[i]["host"]}"
        puts "Process: #{subject[i]["process"]}"
        puts "ID: #{subject[i]["id"]}"
        puts "Message Text: #{subject[i]["message_text"]}"
        puts "Tags: #{subject[i]["tags"]}"
        puts "============================================================"
      end
    end

  end

end
