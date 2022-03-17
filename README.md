# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    '2.6.6'
* Rails version
    '~> 6.1.4', '>= 6.1.4.1'


Instructions:

1 - Command to Execure this code
    `rake terms_and_conditions:generate`
    What will happen with that =>
    i- it is reading an input file created inside tmp folder with name template.txt
    ii- it is creating an output file inside tmp folder with name `T&C.txt`, with desired output after processing the `template.txt` file.
    iii- All the processing is done inside a service named as `create_tc.rb` (here tc represents terms and conditions) which is called inside a rake task named as          
        `terms_and_conditions.rake` in which we are passing the test data to our service which can changed for different scenarios.

2 - Command to run specs for respective changes
    `rspec spec/services/create_tc_spec.rb`
    i- `rspec-rails` gem has been used to write down the specs for respective changes.
    ii- inside specs i have checked:
        -`Output file existence`
        -`Will check if output file contains input clauses and Sections`
        -`Will compare output file content with what it should be`

3 - Time Taken to Complete this.
    1 hour 15 minutes