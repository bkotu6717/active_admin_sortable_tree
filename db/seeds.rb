# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Page.delete_all

30.times.each do |x|
 Page.create(title: "Page #{x+1}", body: "<h1>Page #{x+1} content goes here</h1>")
end

