# Overviews
- bot for [`ChatWork`](https://www.chatwork.com/)
- handled by [`Ruboty`](https://github.com/r7kamura/ruboty) (thanks!)

# Installation
- I recommend use `Gemfile`, `bundle install --path vendor/bundle` and `bundle exec ruboty`

#### Use `gem install` command
```bash
$ gem install ruboty
$ gem install ruboty-chatwork
$ gem install dotenv
```

#### Optional Installation as you like
```bash
$ gem install ruboty-google_image
$ gem install foreman
$ gem install mechanize
$ etc...
```

# Prepare
- you must edit `.env` file
    - refer `sample.env`
- you must edit the name and the account id of chat members in `config/users_info.yml`
    - you can edit it not manually but automatically by [`chatwork-ruby`](https://github.com/asonas/chatwork-ruby)
    
# Execution
```bash
$ ruboty --load load_chatwork_ruboty.rb --dotenv
```

#### Note
if `load_chatwork_ruboty.rb` renames to `ruboty.rb`, collision occurs

# Customize
- You can create your own bots!
    - add your handler files in `handlers/*.rb`
    - handler files are auto loaded when exec `Ruboty`
- You can include your `Ruby` logic!
    - add your codes in `lib/`

# Limitation
- per one execution, you can operate a bot in ONE room
    - if you wanna operate multi bots, exec multi Ruboty
        - CAUTION: be careful of rate limits...
- about above, I send [Pull Request!](https://github.com/mhag/ruboty-chatwork/pull/2)

# LICENSE
[MIT LICENSE](LICENSE)
