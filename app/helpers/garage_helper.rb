module GarageHelper
  def my_garage_path
    return nil if !user_signed_in?
    garage_path current_user.garage
  end
  def my_garage
    return nil if !user_signed_in?
    current_user.garage
  end
end
