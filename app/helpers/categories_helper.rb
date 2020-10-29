module CategoriesHelper
  @@i = 0
  def revert
    if @@i == 6
      @@i = 0
    else
      @@i += 1
    end
  end
end
