module Hanzo
  module Heroku
    class << self
      def available_labs
        Hanzo.run('heroku labs').each_line.to_a.reduce([]) do |memo, line|
          if line = /^\[\s\]\s+(?<name>\w+)\s+(?<description>.+)$/.match(line)
            memo << [line[:name], line[:description]]
          else
            memo
          end
        end
      end
    end
  end
end
