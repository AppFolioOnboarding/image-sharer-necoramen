# This migration comes from acts_as_taggable_on_engine (originally 6)
if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class AddMissingIndexesOnTaggings < ActiveRecord::Migration[4.2]; end
else
  class AddMissingIndexesOnTaggings < ActiveRecord::Migration; end
end
AddMissingIndexesOnTaggings.class_eval do
  def change
    add_index_unless_exists :tag_id
    add_index_unless_exists :taggable_id
    add_index_unless_exists :taggable_type
    add_index_unless_exists :tagger_id
    add_index_unless_exists :context
    add_index_unless_exists %i[tagger_id tagger_type]

    add_index_with_name_unless_exists %i[taggable_id taggable_type tagger_id context], 'taggings_idy'
  end

  def add_index_unless_exists(col)
    add_index ActsAsTaggableOn.taggings_table, col unless index_exists? ActsAsTaggableOn.taggings_table, col
  end

  def add_index_with_name_unless_exists(col, name)
    return if index_exists? ActsAsTaggableOn.taggings_table, col, name: name

    add_index ActsAsTaggableOn.taggings_table, col, name: name
  end
end
