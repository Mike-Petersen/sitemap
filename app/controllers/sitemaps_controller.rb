class SitemapsController < ActionController::Base
	caches_action :show, :expires_in => 1.hour, :race_condition_ttl => 1, :cache_path => Proc.new { |controller|
		sitemaps_url(format: params[:format])
	}

	def show
		@widgets = SitemapWidget.find(:all, :conditions => "parent_widget_id IS NULL")
		@site = SitemapSetting.find(:first)
		@static_links = SitemapStaticLink.find(:all)
		respond_to do |format|
			format.html
			format.xml
			format.css
			format.xsl
		end
	end
end
