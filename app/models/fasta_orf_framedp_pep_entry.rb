class FastaOrfFramedpPepEntry < ActiveRecord::Base
  attr_accessible :name, :record
  belongs_to :framedp_summary
end
