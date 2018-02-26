#!/usr/bin/ruby
# @Author: dieuson
# @Date:   2018-02-26 18:34:41
# @Last Modified by:   Dieuson Virgile
# @Last Modified time: 2018-02-26 19:57:37

require './request.rb'
include Request

def main()

	url = "https://www.ma-reduc.com/majax.php"
	body = {"comment": "",
			"id_coupon": "4520330",
			"login": "-",
			"method": "CouponReview/add",
			"type_coupon": "web",
			"ugc_type": "CouponReview",
			"work": "1"}
	# for i in 0..10
	# 	Thread.new {
	# 		response = Request.post(url, body)
	# 		puts response
	# 	}
	# 	# sleep_time = rand(300..600)
	# 	sleep_time = 1
	# 	puts "sleep #{sleep_time}"
	# 	sleep(sleep_time)
	# end
	while true
		Thread.new {
			response = Request.post(url, body)
			puts response
		}
		sleep_time = rand(300..600)
		puts "sleep #{sleep_time}, next time: #{(Time.now + sleep_time).strftime("%H:%M:%S")}"
		sleep(sleep_time)
	end
end

main()