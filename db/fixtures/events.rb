Event.seed_many(:id, [


#>>> Begin Dummy seed data

  { :id => 1, 
    :org_id => 1,
    :name => "Church Autumn Fair",
    :category_id => 2,
    :location_id => 5, 
    :is_active => true, 
    :start_at => DateTime.new(y=2009,m=11,d=30, h=16,min=30,s=00), 
    :end_at => DateTime.new(y=2009,m=11,d=30, h=18,min=30,s=00),
    :album_id => 1,
    :description => "Our second annual autumn church fair is on its way. Come for food, horses, and historical attractions!"},
    { :id => 5, 
      :org_id => 1,
      :name => "Church Autumn Fair",
      :category_id => 3,
      :location_id => 5, 
      :is_active => true, 
      :start_at => DateTime.new(y=2009,m=11,d=30, h=16,min=30,s=00), 
      :end_at => DateTime.new(y=2009,m=11,d=30, h=18,min=30,s=00),
      :album_id => 1,
      :description => "Our second annual autumn church fair is on its way. Come for food, horses, and historical attractions!"},
      { :id => 6, 
        :org_id => 1,
        :name => "Church Autumn Fair",
        :category_id => 4,
        :location_id => 5, 
        :is_active => true, 
        :start_at => DateTime.new(y=2009,m=11,d=30, h=16,min=30,s=00), 
        :end_at => DateTime.new(y=2009,m=11,d=30, h=18,min=30,s=00),
        :album_id => 1,
        :description => "Our second annual autumn church fair is on its way. Come for food, horses, and historical attractions!"},
        { :id => 7, 
          :org_id => 1,
          :name => "Church Autumn Fair",
          :category_id => 5,
          :location_id => 5, 
          :is_active => true, 
          :start_at => DateTime.new(y=2009,m=11,d=30, h=16,min=30,s=00), 
          :end_at => DateTime.new(y=2009,m=11,d=30, h=18,min=30,s=00),
          :album_id => 1,
          :description => "Our second annual autumn church fair is on its way. Come for food, horses, and historical attractions!"},
    
    { :id => 2, 
    :org_id => 1,
    :name => "Lewis and Clark BBQ",
    :category_id => 1,
    :location_id => 5, 
    :is_active => true, 
    :start_at => DateTime.now, 
    :end_at => DateTime.now,
    :album_id => 1,
    :description => "Our second annual Lewis and Clark BBQ is on its way. Come for food, horses, and historical attractions!"}

])