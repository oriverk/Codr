# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      title: 'Codr0',
      description: 'share code on Twitter',
      icon: [
        { href: image_url('Path.svg') },
        { href: image_url(''), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      # noindex: !Rails.env.production?,
      canonical: request.original_url,
      charset: 'UTF-8',
      og: {
        title: :title,
        description: '',
        type: 'website',
        url: request.original_url,
        image: image_url(''),
        site_name: 'Codr0',
        locale: 'ja_JP'
      },
      twitter: {
        site: '@not_you_die',
        card: 'summary_large_image'
      }
    }
  end
end
