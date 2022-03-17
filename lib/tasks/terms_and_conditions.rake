namespace :terms_and_conditions do
  task generate: :environment do
    clauses = [ 
                {"id": 1, "text": 'The quick brown fox'},
                {"id": 2, "text": 'jumps over the lazy dog'},
                {"id": 3, "text": 'and dies'},
                {"id": 4, "text": 'The white horse is white'}
              ]
    sections = [
                {"id": 1, "clauses_ids": [1,2]}
              ]
    File.delete(File.join(File.join(Rails.root, "tmp"), "T&C.txt")) if File.exists?(File.join(File.join(Rails.root, "tmp"), "T&C.txt"))
    CreateTc.new(clauses,sections).call
  end
end