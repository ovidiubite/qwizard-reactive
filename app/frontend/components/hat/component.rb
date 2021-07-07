class Hat::Component < ApplicationViewComponent
  option :hat_name
  option :image_style

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

  STYLES = %w[slideImage playerImage scoreImage topPlayerImage]

  def hat
    if hat_name.instance_of?(String)
      hat_name
    elsif
      HATS[hat_name]
    end
  end

  def style
    if STYLES.include?(image_style)
      image_style
    else
      STYLES[0]
    end
  end
end
