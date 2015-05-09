# TODO

- [x] loggin/loggin-rails gem
- [x] music model
  * user has many musics
  * music has many users
  - [x] have the following columns...
    * level(single table inheritance)
    * name
    * clear
    * fullcombo
- [ ] score model
  * music has many scores
  * score belongs to music
  * have the following columns...
    * archivement_rate
    * miss count
    * play count
- [x] firend model
  * user has many friend
  * friend has many
  * have the following columns...
    * name
    * rank
- [ ] scrape gem
  * http://p.eagate.573.jp/game/reflec/groovin/p/profile/index.html
- [ ] save cookie to user
  * if user has expired cookie, again get cookie and save automatically
- [ ] username or email login
- [ ] music_image model
  * cd conver images for musics
- [ ] routing
  * use root_path after login
- [ ] user_image model
  * user icon
- [x] remove music#show link on music#index
  * when click a table column, move music#show page
- [x] level and difficulty, The reverse is intended to mean that
