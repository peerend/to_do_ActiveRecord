require 'spec_helper'

describe Task do
  it 'can return the not done tasks' do
    not_done_tasks = (1..5).to_a.map { |number| Task.create(:name => "task #{number}", :done => false) }
    done_task = Task.create({:name => "done task", :done => true})
    Task.not_done.should eq not_done_tasks
  end

  it "belongs to a list" do
    list = List.create({:name => "list"})
    task = Task.create({:name => "task", :list_id => list.id})
    task.list.should eq list
  end
end
