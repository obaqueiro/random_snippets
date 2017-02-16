require "google_drive"

 session = GoogleDrive::Session.from_config("config.json")
#
# # Gets list of remote files.
 collections = session.collection_by_title('Album Fotográfico').subcollections
 collection = rand(collections.size)
 files = []
 collections[collection].files { |file| files.push(file) }

 file = files.sample
 file_name = "/tmp/desktop#{rand(10)}.jpg"
 file.download_to_file(file_name)
 system(%Q|osascript -e 'tell application "Finder" to set desktop picture to POSIX file "#{file_name}"'|)

