# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'
require 'byebug'
describe 'CreateTc' do

	before do
		clauses = [ 
						{"id": 1, "text": 'The quick brown fox'},
						{"id": 2, "text": 'jumps over the lazy dog'},
						{"id": 3, "text": 'and dies'},
						{"id": 4, "text": 'The white horse is white'}
					]
		sections = [
						{"id": 1, "clauses_ids": [1,2]}
					]
		CreateTc.new(clauses,sections).call
	end

	describe 'Check file existence' do
		it 'will check output file exists or not' do
			expect(File.exists?(File.join(File.join(Rails.root, "tmp"), 'T&C.txt'))).to eq true
		end
	end 

	describe 'Will check if output file contains input clauses and Sections' do
		it 'should not contains input clauses or sections' do
			File.open(File.join(File.join(Rails.root, "tmp"), 'T&C.txt')).each_with_index do |row, index|
				expect(row).not_to include 'CLAUSE' 
				expect(row).not_to include 'SECTION'
			end
		end

	end 

	describe 'Will compare file content' do

		output_data = "A T&C Document

		This document is made of plaintext.
		Is made of and dies.
		Is made of The white horse is white.
		Is made of The quick brown fox;jumps over the lazy dog.
		
		Your legals.
		"

		it 'should compare output file data' do
				file_content = File.read(File.join(File.join(Rails.root, "tmp"), 'T&C.txt'))
				expect(output_data.gsub(/\t\t/, '')).to eq file_content
		end
	end 	
end