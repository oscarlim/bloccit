class FavoriteMailer < ActionMailer::Base
  default from: "oscar@bloccit.com"
  
  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@oscar-bloccit>"
    headers["In-Reply-To"] = "<post/#{@post.id}@oscar-bloccit>"
    headers["References"] = "<post/#{@post.id}@oscar-bloccit>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end