class CreateAgeCategories < ActiveRecord::Migration
  def change
    create_table :age_categories do |t|
      t.string :name
      t.timestamps
    end
    
    ['Дошкольник', 'Младшая школа', 'Средняя ступень', 'Старшая ступень', 'Студент'].each { |n| AgeCategory.create(name: n) }
  end
end
