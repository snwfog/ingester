$LOAD_PATH.unshift File.expand_path('lib', File.dirname(__FILE__))

require 'rake'
require 'kafka'
require 'table_print'

require 'protocol/message'

kk = Kafka.new(seed_brokers: %w(localhost:9092))

desc 'Produce a message'
task :produce do
  kk.deliver_message(
      Protocol::Message.build('Hello world').to_s,
      topic: 'dev-pageview-normal')
end

desc 'Consume messages'
task :consume do
  kk.each_message(topic: 'dev-pageview-normal') do |m|
    puts %Q(#{m.offset}, #{m.key}, #{m.value})
  end
end

desc 'List all topics'
task :list_topics do
  puts kk.topics
end
