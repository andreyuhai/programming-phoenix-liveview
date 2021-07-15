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

Related commits:
1. [Run mix phx.gen.live FAQ FrequentlyAskedQuestion frequently_asked_questions question answer vote_count:integer user_id:references:users](https://github.com/andreyuhai/programming-phoenix-liveview/commit/0638aa998a89f6ce116d27f2744b94210eb5b5f5)
2. [Add has_many :faqs, FrequentlyAskedQuestions relationship](https://github.com/andreyuhai/programming-phoenix-liveview/commit/ca11d21cbd66e5621ddb2d90b167adb90c8a9db7)
3. [Add endpoints for FAQ](https://github.com/andreyuhai/programming-phoenix-liveview/commit/ad355b60451f66d820fcb322455c7f6e7f24a127)
4. [Change vote_count default to 0, add belongs_to :user association](https://github.com/andreyuhai/programming-phoenix-liveview/commit/e1a8f0be339abd16eacb8b62dba3fdd8091ccc23)
5. [Remove vote_count from cast and validate_required](https://github.com/andreyuhai/programming-phoenix-liveview/commit/b90bb97777f897230ae289906a0a12a23b4e0d94)
6. [Add user_id as hidden_input to the form component](https://github.com/andreyuhai/programming-phoenix-liveview/commit/73d8b3d3b14063aad912d5073a612824cb3e43c5)
7. [Assign current_user to the socket inside mount](https://github.com/andreyuhai/programming-phoenix-liveview/commit/7f5a1d0630648223e84f3a4829ffa65cabd06cf9)
8. [Pass current_user to the live_modal as well so we can use it in form component](https://github.com/andreyuhai/programming-phoenix-liveview/commit/788ee4559d84513bec5b7cc2ed74ae0f22fe325b)
9. [Change query to order all FAQs by inserted_at](https://github.com/andreyuhai/programming-phoenix-liveview/commit/4959fd3d3c6af82897f10e17b73bd3d8842d3b59)
10. [Implement upvote_frequently_asked_question/1](https://github.com/andreyuhai/programming-phoenix-liveview/commit/7be5359cff749a281ffc252d553081b5fc3fe656)
11. [Implement upvote_changeset/2](https://github.com/andreyuhai/programming-phoenix-liveview/commit/f11429e5c190091609f46ba5ecf4164f0b4390d8)
12. [Implement handle_event/3 for upvote event](https://github.com/andreyuhai/programming-phoenix-liveview/commit/6af8149dc5ee9303b7e2ef450a28abc20c42ee19)
13. [Add upvote button to be able to upvote an FAQ](https://github.com/andreyuhai/programming-phoenix-liveview/commit/2ada86f803631e27ee9c0f0150dc378c9bf44bd8)
14. [Show edit button depending on whether the user is the owner of that FAQ](https://github.com/andreyuhai/programming-phoenix-liveview/commit/92e6561f10030054444a6b7d4fdeffda52573d05)
15. [If a user tries to edit a post that they do not own, put a flash and redirect back to index](https://github.com/andreyuhai/programming-phoenix-liveview/commit/f1b85fe04c637b0577f05e25051d390633a837ec)
16. [Remove the if block showing the edit button depending on the ownership of the FAQ, since we now we return an error if the user doesn't own the post and tries to edit it](https://github.com/andreyuhai/programming-phoenix-liveview/commit/40930df5ccb8498758998d24e740853b33b0f700)


Demo

![Screen-Recording-2021-07-15-at-15 25 56](https://user-images.githubusercontent.com/11967154/125796013-19b3a2bd-1d0b-42b0-8a94-a3166d5eb6c4.gif)




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
