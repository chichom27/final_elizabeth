User.seed_many(:id, [
  { :id => 1, 
    :login => "admin",
    :name => "admin",
    :email => "admin@admin.com", 
    :salt => "436088aacaa45f880043382d88407dee97188d0e",
    :crypted_password => "0e6eb2b67e842ce1658c2bf31adc682809d510c4",
    :activation_code => '2e22bd54bbd719cb2cbb5556c57cc02b631814da',
    :activated_at => DateTime.now},
    
    { :id => 4, 
        :login => "reviewer",
        :name => "reviewer",
        :email => "user@user.com", 
        :salt => "fb7eeed7a0678472bdb39e0a06e4c2c040c7567c",
        :crypted_password => "e297737e0e323577332b830fe484bc47f4700693",
        :activation_code => '07494db81eb47f7965a10be7c787ab01a098d37d',
        :activated_at => DateTime.now},

#>>> Begin Dummy seed data


    { :id => 2, 
       :login => "org",
       :name => "org",
       :email => "org@org.com", 
       :salt => "73e3f855b06a18d033a5886a149251ca422482b3",
       :crypted_password => "3a64ab7c70f14b2cb26eb29edd23dfed8010c0fc",
       :activation_code => 'ca85216bbe2caf6d762a0ef4ded6d1ffc978b941',
       :activated_at => DateTime.now,
       :org_id => 1 },
       
       { :id => 3, 
          :login => "user",
          :name => "user",
          :email => "user@user.com", 
          :salt => "9d98a5a45d0353fe40a08a5355a0218413d3b9ad",
          :crypted_password => "1d337febd8678aa661d554ae42767b9e4f0637b3",
          :activation_code => 'fbf465dddb7648d8f667cd20df0f95a42653c343',
          :activated_at => DateTime.now,
          :org_id => 2 },
          
          { :id => 5, 
          :login => "user2",
          :name => "user2",
          :email => "user2@user.com", 
          :salt => "9d98a5a45d0353fe40a08a5355a0218413d3b9ad",
          :crypted_password => "1d337febd8678aa661d554ae42767b9e4f0637b3",
          :activation_code => 'fbf465dddb7648d8f667cd20df0f95a42653c343',
          :activated_at => DateTime.now,
          :org_id => 3 },
          
          { :id => 6, 
          :login => "user3",
          :name => "user3",
          :email => "user3@user.com", 
          :salt => "9d98a5a45d0353fe40a08a5355a0218413d3b9ad",
          :crypted_password => "1d337febd8678aa661d554ae42767b9e4f0637b3",
          :activation_code => 'fbf465dddb7648d8f667cd20df0f95a42653c343',
          :activated_at => DateTime.now,
          :org_id => 4 },
          
          { :id => 7, 
          :login => "user4",
          :name => "user4",
          :email => "user4@user.com", 
          :salt => "9d98a5a45d0353fe40a08a5355a0218413d3b9ad",
          :crypted_password => "1d337febd8678aa661d554ae42767b9e4f0637b3",
          :activation_code => 'fbf465dddb7648d8f667cd20df0f95a42653c343',
          :activated_at => DateTime.now}

])


