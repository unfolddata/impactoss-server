class TaxonomySerializer < ApplicationSerializer
  attributes :title, :tags_recommendations, :tags_measures, :tags_users, :allow_multiple, :has_manager, :priority, :tags_sdgtargets, :is_smart
end
