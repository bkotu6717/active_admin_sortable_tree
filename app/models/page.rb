class Page < ActiveRecord::Base
  	has_ancestry :orphan_strategy => :rootify
end
