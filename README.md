In this branch you can find a solution to the "Give it a try" at the end of Chapter 1.

All the code is in [wrong_live.ex](/lib/pento_web/live/wrong_live.ex)

---

# Give it a try

> Now that you’ve seen a basic LiveView “game”, you can tweak the game so that the user can actually win. You’ll need to:
> 
> - Assign a random number to the socket when the game is created, one the user will need to guess.
> - Check for that number in the `handle_event` for guess.
> - Award points for a right guess.
> - Show a winning message when the user wins.
> - Show a restart message and button when the user wins. Hint: you might want to check out the `live_patch/2` function to help you build that button. You can treat this last challenge as a stretch goal. We’ll get into `live_patch/2` in greater detail in upcoming chapters.

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
