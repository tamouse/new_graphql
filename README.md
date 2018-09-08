# testing out new graphql 1.8 stuff

New rails app created with template.


- ruby version: ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin16]



Added the following gems to the development and test contexts:

- [`factory_bot_rails`](https://github.com/thoughtbot/factory_bot) for testing factories (See: <https://devhints.io/factory_bot>)
- [`faker`](https://github.com/stympy/faker) for generating testing data
- [`pry-rails`](https://github.com/rweng/pry-rails) to run pry as the default rails console
- [`pry-byebug`](https://github.com/deivid-rodriguez/pry-byebug) to integrate pry with byebug


Added [`devise`](https://github.com/plataformatec/devise) and created User model. Additional fields in the User model:

- `username` [String] - a username
- `preferred_name` [String] - the user's preferred name
- `preferred_pronouns` [String] - the user's preferred pronouns, e.g. "she/her/hers", "they/them/theirs", etc.
- `admin` [Boolean] - whether the user is an admin or not. Boolean forced to bi-state by setting `null: false` in the migration. The default is `false`.

The default route `root` is set to `home#welcome`. You may want to modify `app/views/home/welcome.html.erb`

User model created: true


Added [`pundit`](https://github.com/varvet/pundit) and initialized. Created User policy in `app/policies/user_policy.rb`. You should update the user policy for your needs. The default application policy is fully restricted.



Added [GraphQL](http://graphql-ruby.org/) and initialized.

Created `Types::UserGraphType` with fields:

- `id`
- `email`
- `username`
- `preferred_name`
- `preferred_pronouns`
- `admin`
- `created_at` and `created_at_ms`
- `updated_at` and `updated_at_ms`



Added [`webpacker`](https://github.com/rails/webpacker), [`react-rails`](https://github.com/reactjs/react-rails), initialized them both, and added the `application` pack to the default application layout.  You can now build react components for inclusion in standard rails views in `app/javascript/components/`. You can put regular javascript source in `app/javascript/src/` to be imported or required in react components.

- Created `DisplayUser` component, appended to `app/views/home/welcome.html.erb`


Added apollo client libraries to `package.json`:

- `apollo-boost` for the most common set of apollo client libraries
- `react-apollo` for using apollo client with react
- `graphql` for creating query documents

See the [apollo client docs](https://www.apollographql.com/docs/react/) for more info on using apollo client

