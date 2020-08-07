class AddCachedLikesToPosts2 < ActiveRecord::Migration[6.0]
  def self.up
    
  
    Image.find_each(&:update_cached_votes)
  end
  
  def self.down
    remove_column :images, :cached_votes_total
    remove_column :images, :cached_votes_score
    remove_column :images, :cached_votes_up
    remove_column :images, :cached_votes_down
    remove_column :images, :cached_weighted_score
    remove_column :images, :cached_weighted_total
    remove_column :images, :cached_weighted_average
  end
end
