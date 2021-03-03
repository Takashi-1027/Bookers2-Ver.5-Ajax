課題3【Bookers2へ「いいね/コメント機能」を実装】に取り組む

Bookers2-Ver.2のファイルに入っている

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
*

[28. 本の更新失敗時にもエラー文が表示されない]　18. と同様にedit.html.erbにエラー文を書き足す必要があります。

上記の修正はバリデーションが作動し、エラー文が表示されているので、何もしていない。

2021/03/03
新規ユーザー登録時に・introduction can't be blankというエラーが発生した。
解決策はmodels/user.rbのvalidates :introduction, presence: trueが影響していたみたいで
これを削除したら解決した。
