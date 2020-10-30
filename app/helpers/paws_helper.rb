module PawsHelper
  def buy_paws(number)
    link_to("Buy #{number} paws", user_paws_path(user_id: current_user.id, paws: number), method: :post)
  end
end
