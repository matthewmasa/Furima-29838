# frozen_string_literal: true

class Status < ActiveHash::Base
  self.data = [
    { id: 1, condition: '--' },
    { id: 2, condition: '新品、未使用' },
    { id: 3, condition: '未使用に近い' },
    { id: 4, condition: '目立った傷や汚れはなし' },
    { id: 5, condition: 'やや傷あり' },
    { id: 6, condition: '全体的に傷あり' },
    { id: 7, condition: '状態が悪い' }
  ]
end
