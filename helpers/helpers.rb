helpers do
  # If @title is assigned, add it to the page's title.
  def title
    if @title
      "#{@title} -- My Blog"
    else
      "This is a Blog"
    end
  end
 
  # Format the Ruby Time object returned from a post's created_at method
  # into a string that looks like this: 06 Jan 2012
  def pretty_date(time)
   time.strftime("%d %b %Y") unless time==nil
  end

  def logger
      # Create the log file if it doesn't exist,
      # otherwise just start appending to it,
      # preserving the previous content
      log_file = File.open('logs/my_app.log', 'a+')
      # Don't buffer writes to this file. Recommended for development.
      log_file.sync = true
      logger = Logger.new(log_file)
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
end

end