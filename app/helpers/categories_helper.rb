module CategoriesHelper
  @@i = 0
  @@counter = 0
  def revert(size)
    @@i == 6 ? @@i = 1 : @@i += 1
    @@counter += 1
    if size  == @@counter
      value = @@i
      @@i = 0
      @@counter = 0
      return value
    else
      return @@i
    end

  end

  def paws(post)
    link_to(user_paws_path(post_id: post.id, user_id: current_user.id), method: :patch) do
      content_tag(:i, ' Paw', class: "fas fa-paw")
    end
  end

  def votes(post)
  end
end
