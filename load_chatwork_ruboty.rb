require 'yaml'
Dir[File.expand_path('../handlers', __FILE__) << '/*.rb'].each do |file|
  require file
end

CONFIG_FILE = 'config/users_info.yml'.freeze
USERS_INFO  = YAML.load_file(CONFIG_FILE)

def account_id(user_name)
  USERS_INFO.each do |user_info|
    return user_info['account_id'] if user_info['user_name'] == user_name
  end
  '指定されたユーザは存在しません'
end

def user_name(account_id)
  USERS_INFO.each do |user_info|
    return user_info['user_name'] if user_info['account_id'] == account_id
  end
  '指定されたユーザは存在しません'
end

def to_statement(account_id: nil, user_name: nil)
  return "[To:#{account_id}] #{user_name(account_id)} さん" unless account_id.nil?
  return "[To:#{account_id(user_name)}] #{user_name} さん" unless user_name.nil?
  ’’
end

def reply_statement(account_id: nil, reply_message_id: nil)
  # TODO:
  # "[返信 aid=account_id to=reply_message_id]"
end

# [info] は四角で囲むタグ
# [info] は入れ子構造が可能
# [/info] で閉じる際は直前の改行の有無は関係ない
def info_tag(text)
  "[info]#{text}[/info]"
end

# [title] は 冒頭に i という記号を付与するタグ
# [title] には入れ子構造はない
# [/title] で閉じる際は直前の改行の有無は関係ない
def title_tag(text)
  "[title]#{text}[/title]"
end

def code_block_tag(text)
  <<~EOM
    [code]
    #{text}
    [/code]
  EOM
end
