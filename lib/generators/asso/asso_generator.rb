  def do_add_relation (left_class,relation,right_class,option=nil,option_vars=[])
    left_class_file = File.join(Rails.root,"app/models/#{left_class.tableize.singularize}.rb")
    right_class_file= File.join(Rails.root,"app/models/#{right_class.tableize.singularize}.rb")
    print ">> ", right_class_file ,"\n"
    case  #2.2.1 make the changes in each cases
    when "has_one"===relation
      inject_into_file left_class_file,after:"class #{left_class} < ApplicationRecord\n" do
<<-"INJECTED"
  has_one :#{right_class.tableize.singularize}
INJECTED
      end
    when "has_many"===relation
            inject_into_file left_class_file,after:"class #{left_class} < ApplicationRecord\n" do
<<-"INJECTED"
  has_many :#{right_class.tableize.singularize}
INJECTED
      end
    when "belongs_to"===relation
                  inject_into_file left_class_file,after:"class #{left_class} < ApplicationRecord\n" do
<<-"INJECTED"
  belongs_to :#{right_class.tableize.singularize}
INJECTED
    when "many_to_many"===relation
      
    else
      print "ERROR:unknow relationship:#{relation}. going to die\n" 
      #die
    end 
  end
  
  class AssoGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  argument :relations, :type => :array, :default => [], :banner => "action action"
  
  # the api will be:
  # rails g asso user \
  #    has_one:avatar \
  #    has_many:docs:belongs_to_me \
  #    belongs_to:house \
  #    belongs_to:dark_lord:has_one_me \
  #    many_to_many:schools \
  #    many_to_many:users:through:friendship 
  
  #options 

  
  def make_relations
    
    require 'active_support'
    #1. check left class is there. die if none.
    left_class = class_name
    #todo just die now
    left_object = left_class.constantize 
    print "Makeing relations of <#{left_class}>:\n"
    #2.  for each relation do:
    jobs=[]
    relations.each do | relation |
      relation,right_class,option,*option_vars = relation.split ":"
      right_class = right_class.singularize.camelcase
      #print "\n>",relation,",",right_class,",",option,",",option_vars,"\n"
      #2.1 check if the models is there. die if none.
      #todo just die now
      right_obj   = right_class.constantize
      
      #2.1 check if the relations is made already.
      # todo, later
      #2.2 detemine what relation it will be. add reverse relations to jobs
      print "found ", relation," to ",right_class,"\n"
      do_add_relation(left_class,relation,right_class,option,option_vars)
      if ["has_one_me","has_me_only","has_only_me","has_one"].include? option 
        relation="has_one"
        right_class,left_class=left_class,right_class #swap left and right
        do_add_relation(left_class,relation,right_class,option,option_vars)
      end
      if ["belongs_to_me"].include? option
        relation="belongs_to"
        right_class,left_class=left_class,right_class #swap left and right
        do_add_relation(left_class,relation,right_class,option,option_vars)
      end

    end 

    
  end
  
end
