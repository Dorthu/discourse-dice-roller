# name: dice_roller
# about: allows in-post dice rolling, for play-by-post RPGs
# version: 0
# authors: dorthu
# url: https://github.com/Dorthu/discourse-dice-roller

require_relative 'dice'

after_initialize do

    def roll_dice(type)
        num, size = type.match(/([1-9]*)d([0-9]+)/i).captures

        dice = Dice.new(size, SiteSetting.dice_roller_sum_rolls)
        dice.roll(num).to_s
    end

    def inline_roll(post)
        post.raw.gsub!(/\[ ?roll *([1-9]*d[0-9]+) *\]/i) { |c| roll_dice(c) }
        post.set_owner(User.find(-1), post.user)
    end

    def append_roll(post)
        puts '',"TODO - append rolled dice by the dice_roller_append_user"
    end

    on(:post_created) do |post, params|
        if SiteSetting.dice_roller_enabled and post.raw =~ /\[ ?roll *([1-9]*d[0-9]+) *\]/i
            if SiteSetting.dice_roller_inline_rolls
                inline_roll(post)
            else
                append_roll(post)
            end
            post.save
        end
    end
end
