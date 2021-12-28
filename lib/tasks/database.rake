namespace :database do
  desc "Correction of sequences id"
    task correction_seq_id: :environment do
        ActiveRecord::Base.connection.tables.each do |search|
            ActiveRecord::Base.connection.reset_pk_sequence!(search)
        end
    end
end
