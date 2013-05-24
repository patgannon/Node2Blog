require "rubygems"
require "mongo"
require "csv"
include Mongo
db = MongoClient.new.db("patrickgannon")
posts = db.collection("posts")
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
  content = line[Text]
  content.gsub!("http://www.patrickgannon.net/Images/", "/images/")
  posts.insert("title" => line[Title], "title_sub" => line[EntryName], "content" => content, "date" => line[DateAdded], "__v" => 0)
end
