require "administrate/field/base"

class DateTimeField < Administrate::Field::Base
  def to_s
    data
  end
end
