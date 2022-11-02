# # Add a declarative step here for populating the DB with movies.
#
# Given /the following movies exist/ do |movies_table|
#   movies_table.hashes.each do |movie|
#     # each returned element will be a hash whose key is the table header.
#     # you should arrange to add that movie to the database here.
#     Movie.create movie
#   end
#   # pending "Fill in this step in movie_steps.rb"
# end
#
# Then /(.*) seed movies should exist/ do | n_seeds |
#   expect(Movie.count).to eq n_seeds.to_i
# end
#
# # Make sure that one string (regexp) occurs before or after another one
# #   on the same page
#
# Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#   #  ensure that that e1 occurs before e2.
#   #  page.body is the entire content of the page as a string.
#   # pending "Fill in this step in movie_steps.rb"
#   page.body.index(e1).should < page.body.index(e2)
# end
#
# # Make it easier to express checking or unchecking several boxes at once
# #  "When I uncheck the following ratings: PG, G, R"
# #  "When I check the following ratings: G"
#
# When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
#   # HINT: use String#split to split up the rating_list, then
#   #   iterate over the ratings and reuse the "When I check..." or
#   #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#   # pending "Fill in this step in movie_steps.rb"
#   rating_list_split = rating_list.split(', ')
#   if uncheck
#     # uncheck
#     # rating_list_split.each { |each_rating|
#     #   uncheck "ratings_" + each_rating
#     # }
#     rating_list_split.each { |each_rating|
#       steps %Q{
#         When I uncheck the "#{each_rating}" checkbox
#       }
#       # When %{I uncheck the "#{each_rating}" checkbox}
#       # Then %{the #{each_rating} checkbox should not be checked}
#     }
#   else
#     # check
#     # rating_list_split.each { |each_rating|
#     #   check "ratings_" + each_rating
#     # }
#     rating_list_split.each { |each_rating|
#       steps %Q{
#         When I check the "#{each_rating}" checkbox
#       }
#       # When %{I check the "#{each_rating}" checkbox}
#       # Then %{the #{each_rating} checkbox should be checked}
#     }
#   end
# end
#
# # When /^(?:|I )click the "([^"]*)"$/ do |button|
# #   click_button button
# # end
#
# # Part 2, Step 3
# Then /^I should (not )?see the following movies: (.*)$/ do |no, movie_list|
#   # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
#   # pending "Fill in this step in movie_steps.rb"
#   movie_list_split = movie_list.split(", ")
#   if no
#     # not see
#     movie_list_split.each { |each_movie|
#       steps %Q{
#         Then I should not see "#{each_movie}"
#             }
#     }
#   else
#     movie_list_split.each { |each_movie|
#       steps %Q{
#       Then I should see "#{each_movie}"
#             }
#     }
#   end
# end
#
# Then /I should see all the movies/ do
#   # Make sure that all the movies in the app are visible in the table
#   # pending "Fill in this step in movie_steps.rb"
#   # expect(Movie.count).to eq n_seeds.to_i
#   expect(page.body).to have_selector("tr", count: Movie.count+1)
# end
#
# ### Utility Steps Just for this assignment.
#
# Then /^debug$/ do
#   # Use this to write "Then debug" in your scenario to open a console.
#    require "byebug"; byebug
#   1 # intentionally force debugger context in this method
# end
#
# Then /^debug javascript$/ do
#   # Use this to write "Then debug" in your scenario to open a JS console
#   page.driver.debugger
#   1
# end
#
#
# Then /complete the rest of of this scenario/ do
#   # This shows you what a basic cucumber scenario looks like.
#   # You should leave this block inside movie_steps, but replace
#   # the line in your scenarios with the appropriate steps.
#   fail "Remove this step from your .feature files"
# end
