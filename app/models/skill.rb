class Skill < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'C-' },
    { id: 2, name: 'C' },
    { id: 3, name: 'C+' },
    { id: 4, name: 'B-' },
    { id: 5, name: 'B' },
    { id: 6, name: 'B+' },
    { id: 7, name: 'A-' },
    { id: 8, name: 'A' },
    { id: 9, name: 'A+' },
    { id: 10, name: 'S' },
    { id: 11, name: 'S+' },
    { id: 12, name: 'S+10以上' },
  ]
  include ActiveHash::Associations
  has_many :profiles
end