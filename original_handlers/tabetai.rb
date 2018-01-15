require 'yaml'

module Ruboty
  module Handlers
    class Tabetai < Base
      on(
          /(?<keyword>.+) (食べたい|たべたい)\z/i,
          name: "tabetai",
          description: "食べたいとつぶやいた食べ物の画像が投げつけられる"
      )

      # TODO: モジュール化すべき
      def account_id(user_name)
        yaml_file = 'original_handlers/user_name_and_user_account_id.yml'
        YAML.load_file(yaml_file)[user_name]['account_id']
        # [To:#{account_id(message.from_name)}] #{message.from_name}
      end

      def tabetai(message)
        if url = search(message[:keyword])
          message.reply("[To:#{account_id(message.from_name)}] #{message.from_name}\n⊂( ･∀･) 彡 #{url}")
        end
      end

      def search(query)
        Ruboty::GoogleImage::Client.new(query: query).get
      end
    end
  end
end
