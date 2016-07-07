

class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings
    
    #required to include a content_type validation, a file_name validation, or to explicitly state that they’re not going #to have either. Paperclip raises MissingRequiredValidatorError error if you do not do this. So, we add the #validates_attachment_content_type line so that our model will validate that it is receiving a proper filetype.
    
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

    
    def tag_list
        self.tags.collect do |tag|
            tag.name
        end.join(", ")
    end
    
    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end
end
