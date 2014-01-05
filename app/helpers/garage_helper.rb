module GarageHelper
  def my_garage_path
    garage_path current_user.garage
  end
  def my_garage
    current_user.garage
  end
end
