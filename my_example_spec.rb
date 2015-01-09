
require 'json'
require 'rspec'
require_relative './neato_class'

describe 'My behaviour' do

  it 'convert string to hash' do
    string = "{key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]}"
    expected_hash = {"key" => [["value_1", "value_2"],["value_3", "value4"]], 5=>"10:00AM"}
    out_put = eval string
    expect(out_put).eq expected_hash
  end

  it 'should do number 2' do
    h = {"this" => [1,2,3,4,5,6], "that" => ['here', 'there', 'everywhere'], "other" => 'here'}
    c = NeatoClass.new(h)
    expect(c.this).to eq([1,2,3,4,5,6])
    expect(c.that).to eq(['here', 'there', 'everywhere'])
    expect(c.other).to eq('here')
  end
end