# frozen_string_literal: true

module ActiveRecord
  class Relation
    alias total_count count
  end
end
