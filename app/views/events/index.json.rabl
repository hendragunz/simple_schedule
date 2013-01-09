collection @events, :object_root => ''
attributes :name => :text, :start => :start_date, :end => :end_date, :id => :id, :detail => :detail

node :start_date do |u|
  u.start.strftime("%Y-%m-%d %H:%M")
end

node :end_date do |u|
  u.end.strftime("%Y-%m-%d %H:%M")
end