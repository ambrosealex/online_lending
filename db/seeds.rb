# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Lender.create f_name:'Mike', l_name: 'Smith', email:'m@s.com', password:'asdfasdf', balance:5000
Lender.create f_name:'Daniel', l_name: 'Smith', email:'d@s.com', password:'asdfasdf', balance:100000
Lender.create f_name:'Sarah', l_name: 'Smith', email:'s@s.com', password:'asdfasdf', balance:15000
Lender.create f_name:'Tom', l_name: 'Smith', email:'t@s.com', password:'asdfasdf', balance:1000
Lender.create f_name:'Eric', l_name: 'Smith', email:'e@s.com', password:'asdfasdf', balance:100
Lender.create f_name:'Janet', l_name: 'Smith', email:'j@s.com', password:'asdfasdf', balance:40000
Borrower.create f_name:'Terry', l_name: 'Smith', email:'t@s.com', password:'asdfasdf', cause:'Ant Farm', description:'I like ants', goal:750
Borrower.create f_name:'Jim', l_name: 'Smith', email:'j@s.com', password:'asdfasdf', cause:'College', description:'Going to law school', goal:20000
Borrower.create f_name:'Alex', l_name: 'Smith', email:'a@s.com', password:'asdfasdf', cause:'Computer', description:'My old one broke', goal:1000
Borrower.create f_name:'David', l_name: 'Smith', email:'d@s.com', password:'asdfasdf', cause:'Start-Up Company', description:'We sell pants', goal:15000
Borrower.create f_name:'Lisa', l_name: 'Smith', email:'l@s.com', password:'asdfasdf', cause:'Business Venture', description:'Buy and sell gasoline in house', goal:10000
