module CalendarHelper
  def month_link(month_date)
  link_to(month_date.strftime("%B"), {:month => month_date.month, :year => month_date.year}, :class => 'month_link')
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => @shown_month.strftime("%B %Y"),
      :previous_month_text => link_to(image_tag("/images/arrow_l.gif", :border => 0), {:month => @shown_month.last_month.month, :year => @shown_month.last_month.year}, :class => 'month_link') + " " + month_link(@shown_month.last_month),
      :next_month_text => month_link(@shown_month.next_month) + " "+ link_to(image_tag("/images/arrow_r.gif", :border => 0), {:month => @shown_month.next_month.month, :year => @shown_month.next_month.year}, :class => 'month_link'),
      :event_width => 105,
      :event_height => 18,
      :min_height => 70,  
      :event_margin => 2
      
    }
  end

  def event_calendar
    calendar event_calendar_opts do |event|
      "<a href='/events/#{event.id}' title=\"#{h(event.name)}: #{event.start_at.strftime('%A %l:%M %p')} to #{event.end_at.strftime('%A %l:%M %p')}\"><div>#{h(event.name)}</div></a>"
    end
  end
end