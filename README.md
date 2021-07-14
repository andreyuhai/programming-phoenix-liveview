# Chapter 4

### What's in this branch?

- Necessary code for Chapter 3.
- Solutions to "give it a try" exercises at the end of the chapter.

### Give it a try

> These three problems are different in nature. You’ll accomplish three tasks. The first, most straightforward one, is to trace through the ProductLive.Show live view.
>  # Trace Through a Live View

> You’ll have more of an opportunity to get your hands dirty with the exercises at the end of the next chapter. Until then, these tasks will give you some practice with writing core and boundary code.
>
> - Create another changeset in the Product schema that only changes the unit_price field and only allows for a price decrease from the current price.

Related commits:
1. [Create another  changeset in the Product schema](https://github.com/andreyuhai/programming-phoenix-liveview/commit/c9fa88dfbbced9e5ff02a54f451d50696c6ba5f6)

> - Then, create a context function called markdown_product/2 that takes in an argument of the product and the amount by which the price should decrease. This function should use the new changeset you created to update the product with the newly decreased price.

Related commits: 
1. [Create a context function called markdown_product/2](https://github.com/andreyuhai/programming-phoenix-liveview/commit/fb3714675f023a98bcd2f3ff55a3f2631cc3c6aa)

# Other Chapters

- [Chapter 1](https://github.com/andreyuhai/programming-phoenix-liveview/tree/chapter1)
- [Chapter 2](https://github.com/andreyuhai/programming-phoenix-liveview/tree/chapter2)
- [Chapter 3](https://github.com/andreyuhai/programming-phoenix-liveview/tree/chapter3)
- [Chapter 4 [Currently here]](https://github.com/andreyuhai/programming-phoenix-liveview/tree/chapter4)

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
