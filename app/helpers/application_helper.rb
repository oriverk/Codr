# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      title: 'Codr',
      description: 'share code on Twitter',
      keywords: 'rails',
      icon: [
        { href: image_url('') },
        { href: image_url(''), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      noindex: !Rails.env.production?,
      canonical: request.original_url,
      charset: 'UTF-8',
      og: {
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url(''),
        site_name: 'Codr',
        locale: 'ja_JP'
      },
      twitter: {
        site: '@gdCodr',
        card: 'summary_large_image'
      }
    }
  end
end
