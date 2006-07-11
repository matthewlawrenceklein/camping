%w[active_support active_record].map{|l|require l}
module Camping::Models
    A = ActiveRecord
    Base = A::Base
    def Base.table_name_prefix
        "#{name[/\w+/]}_".downcase.sub(/^(#{A}|camping)_/i,'')
    end
end
Camping::S.sub! "autoload(:Base,'camping/db')", "Base=ActiveRecord::Base"
Camping::Apps.each do |app|
    app::Models::Base = ActiveRecord::Base
end
