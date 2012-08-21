# coding: utf-8

require 'spec_helper'

describe Plan do
  it { should validate_presence_of(:title) }
  #before :each do
  #  @plan = Plan.new
  #end

  #it "should validate presence of title" do
  #  @plan.title = nil
  #  @plan.save.should be_false
  #
  #
  #  @plan.title = "테스트"
  #  @plan.save.should be_true
  #  @plan.persisted?.should == true
  #end

  it "디폴트 공개 값은 비공개이어야 한다." do
    @plan.public.should == false
  end
end
