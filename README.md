Here's the corrected and cleaned-up version of your README file:

markdown
Copy code
# FatsecretLite

`fatsecret_lite` is a Ruby gem for interacting with the FatSecret API. It provides an easy way to retrieve food details using OAuth2 authentication. The gem is available at: [https://rubygems.org/gems/fatsecret_lite](https://rubygems.org/gems/fatsecret_lite).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fatsecret_lite'
And then execute:

bash
Copy code
bundle install
Or install it yourself as:

bash
Copy code
gem install fatsecret_lite
Usage
Configuration
Before using the gem, you need to configure it with your FatSecret API credentials. You can do this in an initializer or before making any API calls.

Example configuration:

ruby
Copy code
FatsecretLite.configure do |config|
  config.client_id = 'your_client_id'
  config.client_secret = 'your_client_secret'
end
Replace 'your_client_id' and 'your_client_secret' with your actual FatSecret API credentials.

Fetching Food Details
To fetch food details by food ID, use the get_food_details method:

ruby
Copy code
food_details = FatsecretLite.get_food_details(12345)
puts food_details
This will return the details for the food item with the specified ID in a JSON format.

Development
After checking out the repo, run bin/setup to install dependencies. You can also run bin/console for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run:

bash
Copy code
bundle exec rake install
To release a new version, update the version number in lib/fatsecret_lite/version.rb, and then run:

bash
Copy code
bundle exec rake release
This will create a git tag for the version, push git commits and the created tag, and push the .gem file to rubygems.org.

Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/KapilDevPal/fatsecret_lite. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

Code of Conduct
Everyone interacting in the FatsecretLite project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the code of conduct.

markdown
Copy code

### Key Changes:
1. Fixed formatting and indentation issues.
2. Added missing headings and clear sections.
3. Corrected URLs to GitHub and Rubygems links.
4. Adjusted code blocks for proper syntax highlighting.





