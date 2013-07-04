module TimeTag
  
end

require 'active_support/core_ext/numeric'
require 'active_support/time'
require 'time_tag/tag'
require 'time_tag/processor'

require 'time_tag/suggest'

#dfddf   

#   
#   def initialize rules = {}, timestamp = Time.now
#     @ref = timestamp
#     @rules = rules
#     @upcoming = eval(@ref)
#   end
#   
#   def to_time
#     @upcoming
#   end
# 
#   def next
#     TimeTag.new(@rules, to_time)
#   rescue ArgumentEdfdrror
#     nil
#   end
# 
# # private  
#   def eval(ref, limit = THRESHOLD)
#     raise ArgumentError if limit == 0
#     step = apply_rules(ref)
#     if apply_filters(step)
#       step
#     else
#       eval(step, limit - 1)
#     end
#   end
#   
#   
#   def apply_rules(time)
#     time += @rules[:period] if @rules[:period]
#     time
#     # @rules.each { |k, v| send("apply_#{k}".to_sym, v) }
#   end
#   
#   def apply_period
#   end
#   
#   def apply_filters(time)
#     (@rules[:filters] || []).inject(true) {|res, i| i.call time}
#   end
# end

# rules = {
#  period: 1.day,
#  filters: []
# }
# 
# rules[:filters] << lambda { |time| [6,0].include? time.wday }
# 
# t = TimeTag.new rules
# puts "This is tomorrow: #{t.to_time}"
# puts "This must be day after tomorrow: #{t.next.to_time}"
# puts "And this is the day after after tomorrow: #{t.next.next.to_time}"