class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  
  attr_accessible :article, :title, :photo, :category_id
  
  belongs_to :category  
  has_attached_file :photo, :styles => { :small => "150x150>", :thumb => "100x100>" },
                    :url => "/assets/article_photos/:id/:style/:basename",
                    :path =>":rails_root/public/assets/article_photos/:id/:style/:basename"
  
  validates :category_id, presence: true
  validates :title, presence: true, length: { minimum: 5 }
  validates :article, presence: true, length: { maximum: 500 } 
  
  validates_attachment_size :photo, :less_than => 1.megabyte
  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png'],
                                    :message => "Must be jpg or png"
  
  
  #simple method to search for records
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all, :order => "id DESC")
    end
  end
  
end
