require 'net/http'
require 'date'
require 'time'

module Ruboty
  module Handlers
    class LastModifiedAt < Base
      on(
          /教えて 更新日時/i,
          name: "integrated_last_modified_at",
          description: "最終更新日時が返ってくる。"
      )

      # TODO: モジュール化すべき
      def account_id(user_name)
        yaml_file = 'original_handlers/user_name_and_user_account_id.yml'
        YAML.load_file(yaml_file)[user_name]['account_id']
        # [To:#{account_id(message.from_name)}] #{message.from_name}
      end

      # HACK: NOT DRY...
      def last_modified_at
        http = Net::HTTP.new('www.yahoo.co.jp')
        response = http.head('/')
        response.each do |key, value|
          if key == 'last-modified'
            @last_modified_gmt = value
          end
        end
        Time.parse(@last_modified_gmt).getlocal
      end

      def integrated_last_modified_at(message)
        main_page_last_modified_at = last_modified_at
        # sub_page_last_modified_at  = sub_last_modified_at

        message.reply("[To:#{account_id(message.from_name)}] #{message.from_name}\n最終更新日時は #{main_page_last_modified_at} です。")
      end
    end
  end
end
