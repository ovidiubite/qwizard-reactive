class Authentication::Hat::Component < ApplicationViewComponent
  param :hat_name

  HATS = {
      '0': 'star',
      '1': 'earth',
      '2': 'spiral',
      '3': 'gnome',
      '4': 'nature',
      '5': 'fire',
      '6': 'swamp',
      '7': 'water',
  }

  def hat
    if hat_name.instance_of?(String)
      hat_name
    elsif
      HATS[hat_id]
    end
  end
end
