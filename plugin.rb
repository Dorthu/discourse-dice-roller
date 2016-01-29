# name: dice_roller
# about: allows in-post dice rolling, for play-by-post RPGs
# version: 0
# authors: dorthu
# url: https://github.com/Dorthu/discourse-dice-roller

after_initialize do

    def roll_dice(type)
        num, size = type.match(/([1-9]*)d([0-9]+)/i).captures

        result = ''
        sum = 0

        if num.nil? or num.empty?
            num = 1
        else
            num = num.to_i
        end

        (1..num).each do |n|
            roll = rand(1..size.to_i)
            result += "+#{roll}"
            sum += roll
        end

        if num == 1
            "`" + result[1..-1] + "`"
        else
            "`" + result[1..-1] + "=#{sum}`"
        end
    end

    on(:post_created) do |post, params|
        post.raw.gsub!(/\[ ?roll *([1-9]*d[0-9]+) *\]/i) { |c| roll_dice(c) }
        post.save
    end
end
