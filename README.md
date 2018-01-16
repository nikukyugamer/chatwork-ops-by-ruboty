# Overviews
- bot for `ChatWork`
- by `Ruboty`

# Installation
```bash
$ gem install ruboty
$ gem install ruboty-chatwork
$ gem install foreman
```

- optional
```bash
$ gem install ruboty-google_image
```

# Prepare
- you must edit `.env` file
- you muse edit chat members' name and id in `original_handlers/user_name_and_user_account_id.yml`

# Execute
```bash
$ foreman start
```

# Customize
- You can create your own bots!
- modify and add files
    - `my_ruboty.rb`
    - `original_handlers/main_store_last_updated_at.rb`
    - `original_handlers/tabetai.rb`

# Limitation
- per one execution, you can operate a bot in ONE room
    - if you wanna operate multi bots, exec multi Ruboty
        - CAUTION: be careful of rate limits...

# LICENSE
[MIT LICENSE](LICENSE)
