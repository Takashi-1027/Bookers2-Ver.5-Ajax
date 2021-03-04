class Book < ApplicationRecord
	# has_many :user
	belongs_to :user

	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(current_user)
		favorites.where(user_id: user.id).exists?
	end

		# favoritesのデータベースの中にあるuse_idカラムの各値が,引数として渡されたuseのid(use.id)と一致するのかを調べてくれる。
		# いいねしているかを投稿の右側に表示させる。

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
