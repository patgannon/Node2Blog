require "mongo"
require "csv"
include Mongo
db = MongoClient.new.db("patrickgannon")
posts = db.collection("posts")
#posts.insert("title" => "another test", "title_sub" => "another-test", "content" => "Another TEST!!!", "date" => Time.now.to_s, "__v" => 0)
CSV_FILE_PATH = "subtext_Content.csv"
ID = 0
Title = 1
DateAdded = 2
PostType = 3
Author = 4
Email = 5
BlogId = 6
Description = 7
DateUpdated = 8
Text = 9
FeedBackCount = 10
PostConfig = 11
EntryName = 12
DateSyndicated = 13

CSV.foreach(CSV_FILE_PATH) do |line|
  #puts "Title = #{line[Title]}, e = #{line[EntryName]}"
  posts.insert("title" => line[Title], "title_sub" => line[EntryName], "content" => line[Text], "date" => line[DateAdded], "__v" => 0)
end
