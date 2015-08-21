class InsertStatusTypes < ActiveRecord::Migration
  def change
    %w(Семейный Ребенка).each { |name| StatusType.create(name: name) }
  end
end
