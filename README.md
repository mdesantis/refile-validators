# [Refile::Validators](https://github.com/mdesantis/refile-validators)

WIP - Work In Progress

## API draft

```ruby
class User
  attachment :avatar

  validates :avatar, :'refile/validators/content_type_consistence' =>
    { strategy: :mini_magick }
  validates :avatar, :'refile/validators/content_type_consistence' =>
    { strategy: :mini_magick, content_source: :path }
  validates :avatar, :'refile/validators/content_type_consistence' =>
    { strategy: :file, content_source: :path }
  validates :avatar, :'refile/validators/content_type_consistence' =>
    { strategy: :magic_gem, content_source: :io }
end
```

## License

[MIT](LICENSE.txt)
