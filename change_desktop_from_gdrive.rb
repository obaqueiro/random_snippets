require "google_drive"

 session = GoogleDrive::Session.from_config("config.json")

# # Gets list of remote files.
 collections = session.collection_by_title('Album Fotográfico').subcollections
 collection = rand(collections.size)
 files = []
 collections[collection].files { |file| files.push(file) }

 file = files.sample
 # We have cannot chose the same name as the previous because OSX won't change the image.. so we save the
 # name of the file with some random number appended. We use only 10 different filenames to prevent the files
 # from  filling the disk space.
 file_name = "/tmp/desktop#{rand(10)}.jpg"
 file.download_to_file(file_name)
 system(%Q|osascript -e 'tell application "Finder" to set desktop picture to POSIX file "#{file_name}"'|)


