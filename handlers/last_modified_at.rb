require 'mechanize'
require './lib/operate_datetime'

module Ruboty
  module Handlers
    class LastModifiedAt < Base
      on(
        /更新日時を教えて\z/i,
        name: 'when_last_modified_at',
        description: 'Webページの最終更新日時が返ってくる',
      )

      def last_modified_at
        agent = Mechanize.new
        uri   = 'http://www.geocities.jp/gmx_improve/x68in.htm'
        page  = agent.get(uri)
        page.header['last-modified'] # String
      end

      def body(message)
        last_modified_jst_time_class = OperateDatetime.gmt_to_jst(last_modified_at)
        last_modified_string_class   = OperateDatetime.time_class_to_string_ja(last_modified_jst_time_class)

        header = "#{to_statement(user_name: message.from_name)}\n"
        title = title_tag('更新日時のご連絡')
        description = "更新日時は #{last_modified_string_class} です。"

        %Q(#{header}#{info_tag("#{title}#{description}")}) # これでもまだ複雑
      end

      def when_last_modified_at(message)
        message.reply(body(message))
      end
    end
  end
end
