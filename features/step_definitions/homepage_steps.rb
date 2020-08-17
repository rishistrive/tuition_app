When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the elements$/) do
  expect(page).to have_content('TuitionApp')
  expect(page).to have_link('Home', href: '/ ')
  expect(page).to have_link('Sign up', href: '/users/sign_up')
  expect(page).to have_link('Login', href: '/users/sign_in')
end
