# frozen_string_literal: true

class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, day: '--' },
    { id: 2, day: '1〜2日以内' },
    { id: 3, day: '2〜4日以内' },
    { id: 4, day: '4〜7日以内' }
  ]
end
