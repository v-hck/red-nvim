return {
	username = "", -- needed to fetch profile data
	base_url = "https://codestats.net", -- codestats.net base url
	api_key = "",
	send_on_exit = true, -- send xp on nvim exit
	send_on_timer = true, -- send xp on timer
	timer_interval = 60000, -- timer interval in milliseconds (minimum 1000ms to prevent DDoSing codestat.net servers)
	curl_timeout = 5, -- curl request timeout in seconds
}
