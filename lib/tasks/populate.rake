# code structure credited to Larry Heimann
namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    Rake::Task['db:migrate'].invoke

    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'

    # Step 1: clear any old data in the db
    [IndicatorResource, Indicator, Resource, Competency].each(&:delete_all)

    # Step 2: create the competency
    c = Competency.new
    c.name = "Communication"
    c.active = true
    c.save!

    # Step 3: add the indicators

    i1 = Indicator.new
    i1.level = "Compantion"
    i1.description = "Able to organize own thoughts and outline intended meaning of a message"
    i1.active = true
    i1.competency = c
    i1.save!

    i2 = Indicator.new
    i2.level = "Compantion"
    i2.description = "Able to identify and may employ active listening skills"
    i2.active = true
    i2.competency = c
    i2.save!

    i3 = Indicator.new
    i3.level = "Compantion"
    i3.description = "Able to indentify common nonverbal cues"
    i3.active = true
    i3.competency = c
    i3.save!

    i4 = Indicator.new
    i4.level = "Compantion"
    i4.description = "Able to indetify various media used to deliver messages"
    i4.active = true
    i4.competency = c
    i4.save!

    i5 = Indicator.new
    i5.level = "Compantion"
    i5.description = "Able to comprehend the content of oral and written messages by applying personal context to interpret the meaning"
    i5.active = true
    i5.competency = c
    i5.save!

    i6 = Indicator.new
    i6.level = "Compantion"
    i6.description = "Able to present simple, familiar information to familiar audiences by using preferred method of communication"
    i6.active = true
    i6.competency = c
    i6.save!

    i7 = Indicator.new
    i7.level = "Compantion"
    i7.description = "Able to present intentions and ideas to a familiar individual when prompted by the individual"
    i7.active = true
    i7.competency = c
    i7.save!

    i8 = Indicator.new
    i8.level = "Contributor"
    i8.description = "Able to select the most appropraite medium of communication to deliver a menaningful message"
    i8.active = true
    i8.competency = c
    i8.save!

    i9 = Indicator.new
    i9.level = "Contributor"
    i9.description = "Able to clearly and concisely deliver the meaning of a message using various media"
    i9.active = true
    i9.competency = c
    i9.save!

    i10 = Indicator.new
    i10.level = "Contributor"
    i10.description = "Able to actively listen to others and clarify the meaning of a message"
    i10.active = true
    i10.competency = c
    i10.save!

    i11 = Indicator.new
    i11.level = "Contributor"
    i11.description = "Able to evaluate previous interactions and develop a communication strategy to accommodate audiences' preferences"
    i11.active = true
    i11.competency = c
    i11.save!

    i12 = Indicator.new
    i12.level = "Contributor"
    i12.description = "Able to present written communication in an easy-to-read format"
    i12.active = true
    i12.competency = c
    i12.save!

    i13 = Indicator.new
    i13.level = "Contributor"
    i13.description = "Able to articulate intentions, ideas and feelings to a large group"
    i13.active = true
    i13.competency = c
    i13.save!

    i14 = Indicator.new
    i14.level = "Contributor"
    i14.description = "Able to articulate thoughts using proper grammer in written and verbal form"
    i14.active = true
    i14.competency = c
    i14.save!

    i15 = Indicator.new
    i15.level = "Contributor"
    i15.description = "Able to deliver an informational message which encourages others to take action"
    i15.active = true
    i15.competency = c
    i15.save!

    i16 = Indicator.new
    i16.level = "Champion"
    i16.description = "Able to evaluate the environment and/or audience to determine the most appropraite medium for delivering a meaningful message"
    i16.active = true
    i16.competency = c
    i16.save!

    i17 = Indicator.new
    i17.level = "Champion"
    i17.description = "Able to determine the effectiveness of a chosen medium in delivering a message"
    i17.active = true
    i17.competency = c
    i17.save!

    i18 = Indicator.new
    i18.level = "Champion"
    i18.description = "Able to deliver an inspiring and informative message regarding departmental and/or organizational objectives using multile modes of communication"
    i18.active = true
    i18.competency = c
    i18.save!

    i19 = Indicator.new
    i19.level = "Champion"
    i19.description = "Able to paraphrase or extract meaning from others' communcation"
    i19.active = true
    i19.competency = c
    i19.save!

    i20 = Indicator.new
    i20.level = "Champion"
    i20.description = "Able to indetify and interpret nonverbal cues"
    i20.active = true
    i20.competency = c
    i20.save!

    i21 = Indicator.new
    i21.level = "Champion"
    i21.description = "Able to adjust communication approach while delivering a message by analyzing the audience's verbal and nonverbal cues"
    i21.active = true
    i21.competency = c
    i21.save!

    i22 = Indicator.new
    i22.level = "Champion"
    i22.description = "Able to encourage others to openly and clearly express intentions and ideas"
    i22.active = true
    i22.competency = c
    i22.save!

    i23 = Indicator.new
    i23.level = "Champion"
    i23.description = "Able to help others develop appropriate and effective communication strategies"
    i23.active = true
    i23.competency = c
    i23.save!

    i24 = Indicator.new
    i24.level = "Champion"
    i24.description = "Able to clarify complex information into simple, easy-to-understand terms and translate complex concepts for a broader audience"
    i24.active = true
    i24.competency = c
    i24.save!


    # # Step 2: add some categories to work with (small set for now...)
    # categories = %w[".NET", "Agile Practices", "Android", "Databases", "Design", "Java", "PHP", "Python", "Rails", "Ruby", "Security", "Testing", "iOS"]

    # categories = %w[Ruby Rails Python PHP .NET Java Databases iOS Android Design Testing Security Agile\ Practices]
    # categories.sort.each do |category|
    #   # create an Category object and assign the name passed into block
    #   a = Category.new
    #   a.name = category
    #   a.active = true
    #   # save with bang (!) so exception is thrown on failure
    #   a.save!
    # end

    # # Step 3: add 50 authors to the system and associated books
    # 50.times do 
    #   author = Author.new
    #   # get some fake data using the Faker gem
    #   author.first_name = Faker::Name.first_name
    #   author.last_name = Faker::Name.last_name
    #   # assume 90% or so of authors are active
    #   chance_active = rand(10)  # will generate numbers 0,1,2,3,4,5,6,7,8,9 at random
    #   if chance_active.zero?
    #     author.active = false
    #   else
    #     author.active = true
    #   end
    #   # set the timestamps
    #   author.save!
    # end

    # # Step 4: add some books to the system
    # books = [["The Little .NET Book",1],["The Little Agile Book",2],["The Little Android Book",3],["The Little Databases Book",4],["The Little Design Book",5],["The Little Java Book",6],["The Little PHP Book",7],["The Little Python Book",8],["The Little Rails Book",9],["The Little Ruby Book",10],["The Little Security Book",11],["The Little Testing Book",12],["The Little iOS Book",13],["The Secrets of .NET",1],["The Secrets of Agile",2],["The Secrets of Android",3],["The Secrets of Databases",4],["The Secrets of Design",5],["The Secrets of Java",6],["The Secrets of PHP",7],["The Secrets of Python",8],["The Secrets of Rails",9],["The Secrets of Ruby",10],["The Secrets of Security",11],["The Secrets of Testing",12],["The Secrets of iOS",13],["Programming .NET",1],["Programming Agile",2],["Programming Android",3],["Programming Databases",4],["Programming Design",5],["Programming Java",6],["Programming PHP",7],["Programming Python",8],["Programming Rails",9],["Programming Ruby",10],["Programming Security",11],["Programming Testing",12],["Programming iOS",13],[".NET for Idiots",1],["Agile for Idiots",2],["Android for Idiots",3],["Databases for Idiots",4],["Design for Idiots",5],["Java for Idiots",6],["PHP for Idiots",7],["Python for Idiots",8],["Rails for Idiots",9],["Ruby for Idiots",10],["Security for Idiots",11],["Testing for Idiots",12],["iOS for Idiots",13]]
    # books.each do |book|
    #   b = Book.new
    #   b.title = book[0]
    #   b.category_id = book[1]
    #   # decide book status
    #   book_status = 1+rand(6)
    #   if book_status == 1
    #     # the book is proposed, but not under contract
    #     b.proposal_date = [5.weeks.ago, 4.weeks.ago, 3.weeks.ago, 1.week.ago].sample
    #     b.contract_date = nil
    #     b.published_date = nil
    #     b.units_sold = 0
    #   elsif book_status == 2
    #     # the book is under contract, but not yet published
    #     b.proposal_date = [6.months.ago, 5.months.ago, 4.months.ago].sample
    #     b.contract_date = [3.months.ago, 2.months.ago, 1.months.ago].sample
    #     b.published_date = nil
    #     b.units_sold = 0
    #   else
    #     # the book is published
    #     b.proposal_date = [24.months.ago, 21.months.ago, 19.months.ago].sample
    #     b.contract_date = [18.months.ago, 16.months.ago, 13.months.ago].sample
    #     b.published_date = [12.months.ago, 10.months.ago, 9.months.ago].sample
    #     b.units_sold = [1000, 9000, 20000, 37000, 49000, 82000, 125000, 254000, 491000, 693000, 1045000].sample
    #   end
    #   # set the timestamps
    #   b.created_at = Time.now
    #   b.updated_at = Time.now
    #   # save with bang (!) so exception is thrown on failure
    #   b.save!
    # end

    # # Step 5: connect each book to 1 or 2 authors
    # all_book_ids = Book.all.map{|b| b.id}
    # all_active_author_ids = Author.active.map{|a| a.id}
    # all_book_ids.each do |bid|
    #   # add a book author
    #   ba1 = BookAuthor.new
    #   ba1.book_id = bid
    #   ba1.author_id = all_active_author_ids.sample
    #   ba1.save!
    #   # add a second authors if book_id is even
    #   if bid%2 == 0
    #      ba2 = BookAuthor.new
    #      ba2.book_id = bid
    #      ba2.author_id = all_active_author_ids.sample
    #      ba2.save!
    #   end
    #   # add a second authors if book_id is divisible by ten
    #   if bid%10 == 0
    #      ba3 = BookAuthor.new
    #      ba3.book_id = bid
    #      ba3.author_id = all_active_author_ids.sample
    #      ba3.save!
    #   end
    # end
  end
end