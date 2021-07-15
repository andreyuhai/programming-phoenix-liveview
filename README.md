# Chapter 4

### What's in this branch?

- Necessary code for Chapter 4.
- [Solutions to "give it a try" exercises at the end of the chapter.](https://github.com/andreyuhai/programming-phoenix-liveview/tree/chapter4#give-it-a-try)

---

### Give it a try

> These three problems are different in nature. You’ll accomplish three tasks. The first, most straightforward one, is to trace through the ProductLive.Show live view.
> ### Trace Through a Live View
> Start from the `Index` page’s implementation of the link to the product show page and work your way through the route, `mount/3`, `handle_params/3`, and `render/1` lifecycle. Answer these questions:>
> - Which route gets invoked when you click the link on the Index page to view a given product?

`live "/products/:id", ProductLive.Show, :show`

> - What data does Show.mount/3 add to the socket?

Nothing special, only passes the same socket data intact as you can see [here](https://github.com/andreyuhai/programming-phoenix-liveview/blob/chapter4/lib/pento_web/live/product_live/show.ex#L6-L9).

> - How does the `ProductLive.Show` live view use the `handle_params/3` callback?

To add the `page_title` and specific `product` information given by the `id` into the socket.

> - How does the `ProductLive.Show` template render the Product Edit form and what events does that form support?

Using `live_patch/2`, supported events by the edit form are `validate` on change and `save` on submit.

> When you’re done, display your own message on the page by adding some content to the Show live view’s socket.assigns and then rendering it in the template.

Related commits: 
1. [Add custom_message key to assigns](https://github.com/andreyuhai/programming-phoenix-liveview/commit/753b44321c0de10e9ee74722d2e55047dca47499)
2. [Show custom_message on template](https://github.com/andreyuhai/programming-phoenix-liveview/commit/1d8e1e94ae7d16d0b55c076ee6a07548f37ddeec)

> ### Change the Index Live View
> Let’s tackle a more challenging problem now. You’ll make a slight tweak to the `index.html.leex` live view.
>
> - Instead of showing `<td><%= product.name %></td>` as a column containing the plain product name, make that name a link that brings the user to the product show page. Think about whether you need to reach for the `live_redirect/2` or `live_patch/2` function here.

Since we want to redirect to another live view (namely PentoWeb.ProductLive.Show) we need a `live_redirect/2` as [the docs](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.Helpers.html#live_patch/2) say.

Related commits:
1. [Add live_redirect to product name to redirect to product show](https://github.com/andreyuhai/programming-phoenix-liveview/commit/8aecb360b972da09fad5aaecbd7f6f607ebec88f) 

> - Next, remove the show link from the list of actions accompanying a given product table row.

Related commits:
1. [Remove show link](https://github.com/andreyuhai/programming-phoenix-liveview/commit/9201c477c36cfaf2d44929f6450ba625cf43175d)



> ### Generate Your Own LiveView
> This final, more complex, task will ask you to combine everything you’ve learned in this and the previous chapter. You’ll run the Phoenix Live generator again to create a new set of CRUD features for a resource, FAQ, or “frequently asked question”. This feature will allow users of our gaming site to submit questions, answer them, and up-vote them. Each FAQ should have fields for a question, an answer, and a vote count. Devise your generator command and run it. Then, fire up the Phoenix server and interact with your generated FAQ CRUD features! Can you create a new question? Can you answer it? Trace some of the generated code pathways that support this functionality.

---

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
