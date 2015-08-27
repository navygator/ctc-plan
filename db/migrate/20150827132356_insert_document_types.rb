class InsertDocumentTypes < ActiveRecord::Migration
  def change
    ['Заявление', 'Свидетельство о рождении', 'Договор', 'Медицинское заключение о состоянии здоровья'].each do |n|
      DocumentType.create(name: n)
    end
  end
end
