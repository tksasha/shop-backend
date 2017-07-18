require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_and_belong_to_many :categories }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of(:name).case_insensitive }

  it { should act_as_paranoid }

  it { should have_attached_file :image }

  it { should validate_attachment_presence :image }

  it { should validate_attachment_content_type(:image).allowing('image/gif', 'image/jpeg', 'image/png') }

  it { should validate_attachment_size(:image).in(0..5.megabytes) }

  it { should validate_presence_of :price }

  it { should validate_numericality_of(:price).is_greater_than(0) }
end
