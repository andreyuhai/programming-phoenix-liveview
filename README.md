# Chapter 2

### What's in this branch?

- Necessary code for Chapter 2.
- Solutions to "give it a try" exercises at the end of the chapter.

### Give it a try

> These problems deal with small tweaks to the existing generated code.

> - If you already have an email service, try plugging it in to the generated authentication service so that it will really send the user an email when they register for an account. Did you have to add additional arguments to the existing functions?

Not implemented yet, can use SendGrid.

> - Add a migration and a field to give the User schema a username field, and display that username instead of the email address when a user logs in. Did you require the username to be unique?

Related commits: 
1. [Create a migration to add username column to users table](https://github.com/andreyuhai/programming-phoenix-liveview/commit/62fc1e0e152bfb36d96c5758283deb034629ca28)
2. [Create a migration to add unique index to username column for users table](https://github.com/andreyuhai/programming-phoenix-liveview/commit/c6a34fa00ace1188552678102a2b2d213d5bbe31)
3. [Add username field to the User schema](https://github.com/andreyuhai/programming-phoenix-liveview/commit/ff6b5a5c98b7513b4ca0d77da62631213e02ba01)
4. [Show username after logging in instead of user email](https://github.com/andreyuhai/programming-phoenix-liveview/commit/602e4f658130bae41aa61b97f7d606f5e5503d57)


> - If a logged in user visits the / route, make them redirect to the /guess route.

Related commits: 
1. [If a logged in user visits the / route, make them redirect to the /guess route.](https://github.com/andreyuhai/programming-phoenix-liveview/commit/68a142f4bd93a11182157d8ba8298ef79747f01e) 

# Pento

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
