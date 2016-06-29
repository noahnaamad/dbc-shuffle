module LocationsHelper
  def locations_for_select
    Location.pluck(:name, :id)
  end
end
