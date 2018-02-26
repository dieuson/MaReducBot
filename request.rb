#!/usr/bin/ruby
# @Author: dieuson
# @Date:   2017-12-01 13:42:31
# @Last Modified by:   Dieuson Virgile
# @Last Modified time: 2018-02-26 18:46:58

require 'uri'
require 'net/http'
require 'json'

module Request
	attr_reader :response

	def post(url, body)
		uri = URI.parse(url)
		header = {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}	
		postData = Net::HTTP.post_form(uri, body)
		@response = JSON.parse(postData.body)
		return (@response)
	end

	def get(url)
		uri = URI.parse(url)
		get_data = Net::HTTP.get(uri)
		return (JSON.parse(get_data))
	end
end