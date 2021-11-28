require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'user_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1',:col_sep => "~")
csv.each do |row|
  User.create!(:name => row['name'], :email => row['email'], :admin => row['admin'], :event => row['event'], :venue => row['venue'], 
  :press => row['press'], :vendor => row['vendor'], :activated => row['activated'], :activated_at => row['activated_at'], 
  :zip => row['zip'], :address => row['address'], :describe => row['describe'])
end


=begin
csv.each do |row|
  t = User.create
  t.name = row['name']
  t.email = row['email']
  t.admin = row['admin']
  t.event = row['event']
  t.venue = row['venue']
  t.press = row['press']
  t.vendor = row['vendor']
  t.activated = row['activated']
  t.activated_at = row['activated_at']
  t.zip = row['zip']
  t.address = row['address']  
  t.describe = row['describe']
  t.save
  # puts "#{t.name}, #{t.email} saved"
end
=end

puts "There are now #{User.count} rows in the User table"