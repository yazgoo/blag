begin
  require 'nanoc3/tasks'
rescue LoadError
  require 'rubygems'
  require 'nanoc3/tasks'
end

require 'stringex'
desc "Create a new post"
task :new_post, :title do |t, args|
  mkdir_p './content/posts'
  args.with_defaults(:title => 'New Post')
  title = args.title
  filename = "./content/posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"

  if File.exist?(filename)
    abort('rake aborted!') if ask("#{filename} already exists. Want to overwrite?", ['y','n']) == 'n'
  end

  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts '---'
    post.puts "title: \"#{title}\""
    post.puts "created_at: #{Time.now}"
    post.puts 'kind: article'
    post.puts 'published: false'
    post.puts "---\n\n"
  end
end
desc "Create a new tag"
task :new_tag, :title, :description do |t, args|
  mkdir_p './content/tags'
  args.with_defaults(:title => 'New Post', :description => '')
  title = args.title
  filename = "./content/tags/#{title}.md"

  if File.exist?(filename)
    abort("#{filename} exists")
  end

  puts "Creating new tag: #{filename}"
  open(filename, 'w') do |post|
    post.puts '---'
    post.puts "tag: \"#{title}\""
    post.puts "title: \"#{title}\""
    post.puts "---\n\n#{args.description}\n"
  end
end
