module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : "Les céramiques artisanales d'Hélène Raynal."
  end

  def meta_product_name
    content_for?(:meta_product_name) ? content_for(:meta_product_name) : "Les céramiques artisanales d'Hélène Raynal."
  end

  def meta_description
    description = "Vente de céramiques et poteries artisanales réalisées par Hélène Raynal. Découvrez dans la boutique mes créations uniques. Vous y retrouverez des céramiques utilitaires et décoratives. Mes créations sont en faïence et calligraphiées au pinceau."
    content_for?(:meta_description) ? content_for(:meta_description) : description
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image).strip : image_path(ENV['HOMEPIC']))
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end

