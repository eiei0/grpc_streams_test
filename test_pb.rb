# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: test.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("test.proto", :syntax => :proto3) do
    add_message "test.ListFoosRequest" do
    end
    add_message "test.CreateFoosRequest" do
      optional :name, :string, 1
    end
    add_message "test.EmptyResp" do
    end
    add_message "test.Foo" do
      optional :name, :string, 1
    end
    add_message "test.Bar" do
      optional :id, :string, 1
      optional :name, :string, 2
    end
  end
end

module Test
  ListFoosRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("test.ListFoosRequest").msgclass
  CreateFoosRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("test.CreateFoosRequest").msgclass
  EmptyResp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("test.EmptyResp").msgclass
  Foo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("test.Foo").msgclass
  Bar = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("test.Bar").msgclass
end
