Given /the following animals exist/ do |animals_table|
  animals_table.hashes.each do |animal|
    Animal.create animal
  end
end

Then /(.*) seed animals should exist/ do | n_seeds |
  expect(Animal.count).to eq n_seeds.to_i
end

Then /^I should (not )?see the following animals: (.*)$/ do |no, animal_list|
  animal_list_split = animal_list.split(", ")
  if no
    # not see
    animal_list_split.each { |each_animal|
      steps %Q{
        Then I should not see "#{each_animal}"
            }
    }
  else
    animal_list_split.each { |each_animal|
      steps %Q{
      Then I should see "#{each_animal}"
            }
    }
  end
end

Then /I should see all the animals/ do
  expect(page.body).to have_selector("tr", count: Animal.count+1)
end