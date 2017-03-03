#!/usr/bin/env ruby

require 'aws-sdk-resources'
require 'net/http'

bucket = ARGV[0]
key = ARGV[1]

s3 = Aws::S3::Resource.new(region:'us-east-1')

obj = s3.bucket(bucket).object(key)

url = URI.parse(obj.presigned_url(:put))

puts "Pre-signed upload URL: #{url}"
