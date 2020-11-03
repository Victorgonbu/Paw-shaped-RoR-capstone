module PawsHelper
  def buy_paws(number)
    link_to("Get #{number} paws x $#{number * 10} USD", user_paws_path(user_id: current_user.id, paws: number), method: :post)
  end
end
