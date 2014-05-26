require 'stringex'
require 'colorize'

def get_timeline
  dates = []
  for item in sorted_articles
    date = get_post_date(item)
    dates << Date.new(date.year, date.month)
  end
  dates.uniq.sort.reverse
end

def all_tags
  tags = []

  for item in items
    next if item[:tag].nil?
    tags << item[:tag]
  end 

  tags.uniq.sort
end

def output_warnings
  tags = all_tags()

  article_tags = []

  sorted_articles.each do |item|
    next if item[:tags].nil?
    item[:tags].each do |tag| 
      article_tags << tag
    end
  end

  article_tags.uniq.each do |article_tag|
    if !tags.include? article_tag
      puts "Warning: The tag \"#{article_tag}\" does not have a corresponding page".yellow
    end
  end

end

def articles_with_year_and_month(year, month)
  articles = []

  unless month.nil?
    articles = sorted_articles.select{|i| year == get_post_date(i).year && month == get_post_date(i).month}
  else
    articles = articles.select{|i| year == get_post_date(i).year}
  end
  
  articles

end

def articles_with_tag(tag)
  sorted_articles.select{|a| a[:tags].include?(tag) rescue false }
end

def article_count_with_tag(tag)
  sorted_articles.select{|a| a[:tags].include?(tag) rescue false }.length
end

def tag_weight(tag)

  tags = []
  tag_weights = Hash.new(0)

  sorted_articles.each do |item|
    next if item[:tags].nil?
    item[:tags].each do |tag| 
    tag_weights[tag] = tag_weights[tag] + 1
    tags << tag
  end
end

  max_weight = tag_weights.values.max

  (10*tag_weights[tag]/max_weight.to_f).round()

end