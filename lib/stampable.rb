module Sherpa #:nodoc:
  module UserstampBasic
    module Stampable
      def self.included(base) #:nodoc:
        base.extend(ClassMethods)
        base.class_eval do
          include InstanceMethods
          #self.stampable
        end
      end
    end
    module ClassMethods
      def stampable
        class_eval do
          before_save :set_updated_by
          before_create :set_created_by
          belongs_to :created_by, :class_name => "User"
          belongs_to :updated_by, :class_name => "User"
		  belongs_to :account        
		end
      end
    end
    
    module InstanceMethods
      def set_updated_by
        self.updated_by = User.current
      end
      
      def set_created_by
        # There are situations where we want to have someone else create/own the item
        self.created_by ||= User.current
	  self.account    ||= User.current.account
      end
    end
  end
end
ActiveRecord::Base.send(:include, Sherpa::UserstampBasic::Stampable) if defined?(ActiveRecord)