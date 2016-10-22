ActiveAdmin.register CacheBusting do
	
	action_item only: :index do
		link_to 'Clear Cache', clear_cache_admin_cache_bustings_path, method: :post, remote: true, class: 'clear_cache', data: {confirm: 'Are you sure to clear the cache?'}
	end

	collection_action :clear_cache, method: :post do
		begin
			url = 'http://api.stackexchange.com/2.2/questions?site=stackoverflow'
			@message = ''
			response = HTTParty.get(url)
			cb = CacheBusting.find_by_url(url)
			if cb
				byebug
				cb.update_attributes(done_by: current_admin_user.email)
			else
				CacheBusting.create(url: url, done_by: current_admin_user.email)
			end
			@message = "Cache Busting success!!"
		rescue Exception => e
			@message = e.message
		end
		respond_to do |format|
			format.js
		end
	end
 end