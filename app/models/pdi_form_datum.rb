class PdiFormDatum < ApplicationRecord
  alias_attribute :id, :pdiid
  self.primary_key  = :pdiid
end
