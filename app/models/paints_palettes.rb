class PaintsPalettes < ActiveRecord::Base
  belongs_to :paint
  belongs_to :palette
end
