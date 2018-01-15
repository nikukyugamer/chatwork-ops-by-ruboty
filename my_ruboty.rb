require './original_handlers/tabetai'
require './original_handlers/last_modified_at'

# Note: 改行はヒアドキュメント形式で勝手に入るので \n などは不要
# 既存の gem を改造するのってこうやってオーバーライドするしかないのかなぁ
module Ruboty
  module Handlers
    begin
      class GoogleImage < Base
        on(
            /(?<keyword>.+) (画像)\z/i,
            name: "image",
            description: "見たい画像が投げつけられる"
        )

        # TODO: モジュール化すべき
        def account_id(user_name)
          yaml_file = 'original_handlers/user_name_and_user_account_id.yml'
          YAML.load_file(yaml_file)[user_name]['account_id']
          # [To:#{account_id(message.from_name)}] #{message.from_name}
        end

        def image(message)
          if url = search(message[:keyword])
            message.reply("[To:#{account_id(message.from_name)}] #{message.from_name}\n⊂( ･∀･) 彡 #{url}")
          end
        end
      end
    rescue
      # TO WRITE
    end
  end
end
