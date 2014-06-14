require 'net/http'
require 'rufus/scheduler'

cookie = "Hm_lvt_9ff57683ae180b128fbbc7e7304899d0=1402372251; JSESSIONID=0A1B7BE4B835B3F9949435E397335311-n1"

refer_date = "1257_2014-06-09"
lineId = "1257"
goDate = "2014-06-09"
mealId = "1689"
adult = '2'
child = '0'
name = '韩式'
mobile = '15201611245'
email = '2570177118@qq.com'

time = "2014/06/14 20:06:20"

index = 'http://m.lailaihui.com/'
uri = URI.parse index
#refer http://www.51testing.com/html/79/605679-850873.html
refer = "http://m.lailaihui.com/fline/reserve/#{refer_date}"
path = "/doFreeLineReserve.action?flReserve.promotionId=0&flReserve.lineId=#{lineId}&flReserve.goDate=#{goDate}&flReserve.mealId=#{mealId}"

http = Net::HTTP.new(uri.host,uri.port)

data = {"flReserve.adult" => "#{adult}", "flReserve.child" => "#{child}", "flReserve.roomNum" => "1", "flReserve.name" => "#{name}",
"flReserve.mobile" => "#{mobile}", "flReserve.email" => "#{email}", "flReserve.orderMsg" => "",
"flReserve.attachments" => "9,2,#{goDate}"}
User_Agent = "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/31.0.1650.63 Chrome/31.0.1650.63"


request =  Net::HTTP::Post.new(path)
request.initialize_http_header({"Cookie" => cookie, "Referer" => refer, "User-Agent" => User_Agent})
request.set_form_data(data)

s = Rufus::Scheduler.new

s.at time do
	#response = http.request(request)
end
sleep(100)

#https://github.com/jmettraux/rufus-scheduler/blob/two/README.rdoc
