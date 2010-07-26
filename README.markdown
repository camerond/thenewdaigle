# Thenewdaigle

A blog about growing a baby, located at [thenewdaigle.com](http://thenewdaigle.com)

# Posting Instructions (for Shannon's benefit)

- `gp` -- git pull: updates your local repo
- `rake blog:new` -- creates `new_article.markdown` file in the date-appropriate directory and opens it in TextMate
- Write your post in Markdown
- Title the blog and change published to 'true'
- Rename the file with a proper permalink (underscores & such)
- `rake` -- point your browser to localhost:9210; view your post, make sure it looks cool
- `ctrl-c` to exit the above server
- `gc -a -m 'New blog post'` -- commit your new post!
- `gp` -- push to the server
- `rake site:deploy` -- make it live!

## To Do

- auto-rename blog entry files
- local development env shows unpublished entries
- image resizing
- monthly pagination
- archive page
- gallery?
- tag pages (perhaps unnecessary)