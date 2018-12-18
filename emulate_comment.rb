#!/usr/bin/ruby
# @Author: dieuson
# @Date:   2018-02-26 18:34:41
# @Last Modified by:   Dieuson Virgile
# @Last Modified time: 2018-03-11 15:06:19

require './request.rb'
include Request

def post_comment(body)
	url = "https://www.ma-reduc.com/majax.php"	
	response = Request.post(url, body)
	puts response
end

def get_pseudo(nb_pseudos)
	all_pseudos = []
	url = "https://randomuser.me/api/?results=#{nb_pseudos}&nat=us,gb"
	response = Request.get(url)
	response.first[1].each do |person|
		name_infos = person["name"]
		pseudo = "#{name_infos['first'].capitalize}#{name_infos["last"].capitalize}"
		pseudo.gsub!(" ", "")
		puts pseudo
		all_pseudos.push(pseudo)
	end
	return all_pseudos
end

def negativ_comment(id, login=nil)
	reason = ["unavailable", "code invalid", "0 reduction", "ne fonctionne pas", "not working", "expired"]
	comment = reason[rand(0...reason.count)]
	if (login.nil?)
		login = "Jemmawas"
	end
	body = {"comment": comment,
		"work": "0",
		"login": login,
		"certified": 0,
		"do_not_work_reason": "nonexistent",
		"id_coupon": id,
		"ugc_type": "CouponProductReview",
		"id_ugc_review": "",
		"method": "CouponReview/add"}
	post_comment(body)
end

def multi_negative_comment(id, nb_comments)
	pseudos = get_pseudo(nb_comments)
	pseudos.each do |login|
		negativ_comment(id, login)
	end
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

def multi_positiv_comment(nb_comments)
	url = "https://www.ma-reduc.com/majax.php"
	@deal_id = 4529602
	@coupon_code_id = 4547648
	i = 0
	while i < nb_comments
		Thread.new {
			simple_comment(@coupon_code_id)
		}
		sleep 1
		i += 1

	end
end

def main()
	url = "https://www.ma-reduc.com/majax.php"
	@deal_id = 4529602
	@coupon_code_id = 4991518
	coupon_codes = [4542550, 4547648]
	i = 0

	while true
		# @coupon_code_id = coupon_codes[i % 2]
		sleep_time = rand(3600..14400)
		next_time = Time.now + sleep_time
		puts "sleep #{sleep_time}, next time: #{(Time.now + sleep_time).strftime("%H:%M:%S")}"

		if (next_time.hour >= 8 && next_time.hour <= 22)
			Thread.new {
				simple_comment(@coupon_code_id)
			}
		else
			puts "Night Night #{(Time.now + sleep_time).strftime("%H:%M:%S")}"
		end
		sleep(sleep_time)
		i += 1
	end
end

# multi_negative_comment(4547500, 58)
# get_pseudo
main()
# multi_positiv_comment(20)