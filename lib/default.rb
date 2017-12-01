# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Tagging
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo

module PostHelper
  def get_post_date(post)
    attribute_to_time(post[:created_at])
  end

  def get_pretty_date(post)
    get_post_date(post).strftime('%B %-d, %Y')
  end

  def relative_path_to_index(what)
    relative_path_to(what) + "index.html"
  end

  def get_post_start(post)
    content = post.compiled_content
    if content =~ /\s<!-- more -->\s/
      content = content.partition('<!-- more -->').first +
                "<div class='read-more pull-right'><a href='#{relative_path_to_index(post)}'>Continue reading &rsaquo;</a></div>"
    end
    return content
  end
end

include PostHelper
