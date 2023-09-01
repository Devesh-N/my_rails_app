class ExternalNumber < ApplicationRecord
  establish_connection EXTERNAL_DB
  self.table_name = 'numbers'
end
