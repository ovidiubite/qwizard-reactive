class Hat::ComponentStories < ViewComponent::Storybook::Stories
  story(:with_slide_image) do
    controls do
      select(:hat_name, ['star', 'earth', 'spiral', 'gnome', 'nature', 'fire', 'swamp', 'water'], 'star')
      select(:image_style, ['slideImage', 'playerImage', 'scoreImage', 'topPlayerImage'], 'slideImage')
    end
  end

  story(:with_player_image) do
    controls do
      select(:hat_name, ['star', 'earth', 'spiral', 'gnome', 'nature', 'fire', 'swamp', 'water'], 'star')
      select(:image_style, ['slideImage', 'playerImage', 'scoreImage', 'topPlayerImage'], 'slideImage')
    end
  end

  story(:with_score_image) do
    controls do
      select(:hat_name, ['star', 'earth', 'spiral', 'gnome', 'nature', 'fire', 'swamp', 'water'], 'star')
      select(:image_style, ['slideImage', 'playerImage', 'scoreImage', 'topPlayerImage'], 'scoreImage')
    end
  end

  story(:with_top_player_image) do
    controls do
      select(:hat_name, ['star', 'earth', 'spiral', 'gnome', 'nature', 'fire', 'swamp', 'water'], 'star')
      select(:image_style, ['slideImage', 'playerImage', 'scoreImage', 'topPlayerImage'], 'topPlayerImage')
    end
  end
end
