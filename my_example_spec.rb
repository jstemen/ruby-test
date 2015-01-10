require 'json'
require 'rspec'
require_relative './neato_class'
require_relative './helper'

describe 'My behaviour' do

  xit 'convert string to hash' do
    string = "{key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]}"
    expected_hash = {"key" => [["value_1", "value_2"], ["value_3", "value4"]], 5 => "10:00AM"}
    out_put = eval string
    expect(out_put).eq expected_hash
  end

  it 'should do number 2' do
    h = {"this" => [1, 2, 3, 4, 5, 6], "that" => ['here', 'there', 'everywhere'], "other" => 'here'}
    c = NeatoClass.new(h)
    expect(c.this).to eq([1, 2, 3, 4, 5, 6])
    expect(c.that).to eq(['here', 'there', 'everywhere'])
    expect(c.other).to eq('here')
  end

  it 'should find the answer to 3' do
    out = Helper.go
    expected = {"factual_id" => [36, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "name" => [72, "900ba574-2cc5-4d22-bf2e-92fb14412abf"], "address" => [25, "9f56d3d6-f1e9-463c-b6b5-020bf2cd9492"], "address_extended" => [8, "59e079c4-cb58-4d0f-854a-671157dfcb55"], "po_box" => [13, "6ec565c0-2a8e-49ea-82a9-b905369185e9"], "locality" => [18, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "region" => [2, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "post_town" => [0, ""], "admin_region" => [0, ""], "postcode" => [5, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "country" => [2, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "tel" => [14, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "fax" => [14, "f9dfe097-74bf-469c-a2c8-901c4a58a80e"], "latitude" => [9, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "longitude" => [11, "59e079c4-cb58-4d0f-854a-671157dfcb55"], "neighborhood" => [57, "5598000e-23c4-4883-bc04-538f29ac07e6"], "website" => [41, "d65bf844-e07c-458d-8d27-10d7608bc79a"], "email" => [28, "a1db9414-01b4-4f7a-8cda-fbb7e007b04f"], "category_ids" => [7, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "category_labels" => [88, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "status" => [1, "b716c681-ad67-4c9c-aab4-7f5fb39e3e11"], "chain_name" => [0, ""], "chain_id" => [0, ""]}
    expected.each{|key,value|
      var = out[key]
      expect(var).to eq(value), "key: #{key} : expected #{value} but got #{var}"
    }
  end
end