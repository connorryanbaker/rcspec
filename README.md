# RCSpec

![Royal Crown Cola](https://upload.wikimedia.org/wikipedia/commons/e/ed/RC_Cola_logo.svg)

The RC Cola of testing libraries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rcspec', git: 'https://github.com/connorryanbaker/rcspec'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rcspec

## Usage

RCSpec implements an RSpec inspired DSL with our old friends `describe`, `it` and `expect`.

```ruby
describe "basic matching" do
  it "detects equality" do
    expect(1 + 1).to.eq(2)
  end

  it "detects inclusion" do
    expect(%i[wow hey there]).to.include(:wow)
  end

  it "detects errors raised" do
    expect { 7 / 0 }.to.raise_error(ZeroDivisionError)
  end

  it "will tell you when an example fails" do
    expect(:foo).to.eq(:bar)
  end
end
```

Run your specs with `bundle exec rcspec` - if a path is provided, RCSpec will run specs in provided file / directory, otherwise it is assumed that the default directory is `spec` in RSpec tradition.

```bash
$ bundle exec rcspec spec/example_spec.rb 

...F

basic matching
        it will tell you when an example fails
        Expectation failed. Expected: bar | Received foo

4 examples, 1 failures
```

## Notably Absent Features

As this is very much a toy project, many of RSpec's most well loved features have yet to be implemented including:
- mocks
- `let` / `let!` / `subject`
- hooks
- nested `describe` / `context` blocks
- configurable output formatting
- much more

Perhaps these will be revisited in the future? Only time will tell :D

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/connorryanbaker/rcspec.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
