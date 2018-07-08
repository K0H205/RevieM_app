class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 50 }
  validates :picture,presence: true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

    #選択したmicropost上にlikeを付与する。user_idは受け取ったcurrent_userのidを適用する
    def likeadd(user)
      likes.create(user_id: user.id)
    end

     #選択したmicropost上のlikeをcurrent_userのidで検索し、likeを解除する
    def likedel(user)
      likes.find_by(user_id: user.id).destroy
    end

    #current_userがいいねしているか確認する
    def like?(user)
      iine_users.include?(user)
    end

    def self.search(search)
      if search
        where("stars=?",search)#入力された値と同じ星の数の投稿を返す
      else
        all 
      end
    end

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
