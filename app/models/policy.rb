class Policy < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'エンジョイ' },
    { id: 2, name: 'ウデマエを上げたい' },
    { id: 3, name: 'XPを上げたい' },
    { id: 4, name: 'ナワバリを上手くなりたい' },
    { id: 5, name: '甲子園に出たい' }
  ]
  include ActiveHash::Associations
  has_many :profiles
end