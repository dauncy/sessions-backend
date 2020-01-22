class CreateSessions < ActiveRecord::Migration[6.0]
    def change 
        create_table :sessions do |t|
            t.references :user
            
            t.string :title
          end

    end 
end 