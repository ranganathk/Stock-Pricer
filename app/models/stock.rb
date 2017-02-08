# == Schema Information
#
# Table name: stocks
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  price        :float            not null
#  maturity     :integer          not null
#  call_option  :boolean          default("false")
#  put_option   :boolean          default("false")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  strikePrice  :float            not null
#  colitility   :float            not null
#  interestRate :float            not null
#

class Stock < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :maturity, presence: true
  validates :strikePrice, presence: true
  validates :colitility, presence: true
  validates :interestRate, presence: true
end
