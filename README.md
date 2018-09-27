# NestedHashCleaner

This gem does the simple task of recursivly removes a key and its value from a nested hash with its method `NestedHashCleaner.clean(hash, key)`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nested_hash_cleaner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nested_hash_cleaner

## Usage

### Clean nested hash with array of hashes inside

```ruby
carpool = { jenny: {
                driving_days: [{
                    day: 'monday',
                    coworker: {
                        max: true,
                        justine: true,
                        alex: true
                        }
                    }]
            },
            max: {
                driving_days: [{
                    day: 'thuesday',
                    coworker: {
                        max: true,
                        justine: true,
                        jenny: true
                        }
                    }]
            },
            alex: {
                driving_days: [{
                    day: 'thursday',
                    coworker: {
                        max: true,
                        justine: false,
                        jenny: true
                        }
                },
                {
                    day: 'friday',
                    coworker: {
                        max: false,
                        justine: false,
                        jenny: true
                        }
                }]
            }
        }

# remove max from carpool hash:
carpool = NestedHashCleaner.clean(carpool, :max)

# => {:jenny=>{
#        :driving_days=>[{
#            :day=>"monday",
#            :coworker=>{
#                :justine=>true,
#                :alex=>true}
#            }]
#        },
#     :alex=>{
#        :driving_days=>[{
#            :day=>"thursday",
#            :coworker=>{
#                :justine=>false,
#                :jenny=>true}},
#            {
#            :day=>"friday",
#            :coworker=>{
#                :justine=>false,
#                :jenny=>true
#                }
#            }]
#        }
#    }

```

### Clean array of hashes

```ruby
# Array of hashes

list =  [
            { alex:  {city: 'New York', age: 38} },
            { jenny: {city: 'New York', age: 39} }
        ]

list = NestedHashCleaner.clean(list, :age)
# => [{:alex=>{:city=>"New York"}}, {:jenny=>{:city=>"New York"}}]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nested_hash_cleaner.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

