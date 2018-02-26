#!/usr/bin/ruby
# @Author: dieuson
# @Date:   2018-02-26 18:34:41
# @Last Modified by:   Dieuson Virgile
# @Last Modified time: 2018-02-27 00:20:48

require './request.rb'
include Request

def post_comment(body)
	url = "https://www.ma-reduc.com/majax.php"	
	response = Request.post(url, body)
	puts response
end

def negativ_comment(id)
	comment = ""
	login = "Jemmawas"
	body = {"comment": comment,
		"work": "0",
		"login": login,
		"certified": 0,
		"do_not_work_reason": "nonexistent",
		"id_coupon": id,
		"ugc_type": "CouponProductReview",
		"id_ugc_review": "",
		"method": "CouponReview/add"}

end

def commented_comment(id)
	comment = "fonctionnel"
	login = "Courserie"
	body = {"comment": comment,
		"id_coupon": id,
		"login": login,
		"method": "CouponReview/add",
		"type_coupon": "web",
		"ugc_type": "CouponReview",
		"work": "1"}
	post_comment(body)
end

def simple_comment(id)
	body = {"comment": "",
		"id_coupon": id,
		"login": "-",
		"method": "CouponReview/add",
		"type_coupon": "web",
		"ugc_type": "CouponReview",
		"work": "1"}
	post_comment(body)
end

def main()
	url = "https://www.ma-reduc.com/majax.php"
	@deal_id = 4529602
	@coupon_code_id = 4520330

	while true
		Thread.new {
			simple_comment(@coupon_code_id)
		}
		sleep_time = rand(300..600)
		puts "sleep #{sleep_time}, next time: #{(Time.now + sleep_time).strftime("%H:%M:%S")}"
		sleep(sleep_time)

	end


	# body = {"comment": "",
	# 		"id_coupon": "4520330",
	# 		"login": "-",
	# 		"method": "CouponReview/add",
	# 		"type_coupon": "web",
	# 		"ugc_type": "CouponReview",
	# 		"work": "1"}
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
end

main()