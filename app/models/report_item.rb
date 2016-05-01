class ReportItem < ActiveRecord::Base
	#acts_as_tree order: "name"
	has_ancestry
	#extend ActsAsTree::TreeView
end
