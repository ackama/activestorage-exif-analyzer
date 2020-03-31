# ActiveStorage::Exif::Analyzer

This gem packages a simple analyzer to extract EXIF metadata from supported files. 
"Supported files" means anything supported by ImageMagick - i.e. more than just JPEG.

The actual analyzer is very simple, and can be found in `lib/active_storage/exif/analyzer` if you would
prefer to just drop this in `app/analyzers` in your codebase and prepend it to the analyzers list yourself.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activestorage-exif-analyzer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activestorage-exif-analyzer

This gem will automatically add itself to the analyzer pipeline and run across any 
supported image files. If you wish to control the precise analyzer order, you can
manipulate the `ActiveStorage.analyzers` array.

## Usage

This gem automatically adds itself to the analysis pipeline, simply ensure that analysis is run on your uploaded files.

To manually see what kind of metadata is extracted from a particular blob, simply grab an attachment and pass the the
blob directly to the analyzer:

``` ruby
ActiveStorage::Exif::Analyzer.new(ActiveStorage::Attachment.first.blob).metadata
 =>  {"width"=>4208,
    "height"=>3120,
    "analyzed"=>true,
    "exif"=> {
        "ApertureValue"=>"200/100",
        "ColorSpace"=>"1",
        "ComponentsConfiguration"=>"1, 2, 3, 0",
        "DateTimeDigitized"=>"2002:12:08 12:00:00",
        "DateTimeOriginal"=>"2015:09:26 18:15:50",
        # ...
    }}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the lint checks and tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ackama/activestorage-exif-analyzer.
