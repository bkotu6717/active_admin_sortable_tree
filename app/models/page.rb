class Page < ActiveRecord::Base
  	has_ancestry :orphan_strategy => :rootify
  	has_paper_trail
end
