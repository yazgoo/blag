# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

module PostHelper

  def get_post_date(post)
    attribute_to_time(post[:created_at])
  end

  def get_pretty_date(post)
    get_post_date(post).strftime('%B %-d, %Y')
  end

  def get_post_start(post)
    content = post.compiled_content
    if content =~ /\s<!-- more -->\s/
      content = content.partition('<!-- more -->').first +
      "<div class='read-more pull-right'><a href='#{relative_path_to(post)}'>Continue reading &rsaquo;</a></div>"
    end
    return content
  end

end

include PostHelper
