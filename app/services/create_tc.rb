
class CreateTc
  def initialize(clauses, sections)
    @file_name = "template.txt"
    @output_file_name = "T&C.txt"
    @clauses = clauses.map { |clause| [clause[:id], clause[:text]] }.to_h
    @sections = sections.map { |a| [a[:id], a[:clauses_ids]]}.to_h
  end

  def call
    File.open(file_path(@output_file_name), "w") do |output_file|
      File.open(file_path(@file_name)).each_with_index do |row, index|
          if (row.include? "CLAUSE")
            clause_id = row[/-(.*?)\]/m, 1].to_i
            clause_text =  @clauses[clause_id]
            row.gsub!(/(\[CLAUSE -\d{0,9}\s\])/,clause_text)
          end
          if (row.include? "SECTION")
            section_id = row[/-(.*?)\]/m, 1].to_i
            clauses_ids = @sections[section_id]
            clauses_text = clauses_ids.inject("") { |res, c_id| 
              (res + (clauses_ids.last == c_id ? @clauses[c_id] : @clauses[c_id]+";"))
            } 
            row.gsub!(/(\[SECTION -\d{0,9}\s\])/,clauses_text)
          end
          output_file << row
      end
    end
  end

  private

  def file_path(file_name)
    File.join(File.join(Rails.root, "tmp"), file_name)
  end

end