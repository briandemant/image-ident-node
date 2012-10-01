exiftags = require 'exiftags'
fs = require 'fs'


exports.info = (path, callback) ->
	fs.stat path, (err, stats) ->
		if err
			callback err
		else
			exiftags.read path, (err, result) ->
				callback null,
					'stats':
						'size': stats['size']
						'mtime': stats['mtime']
						'ctime': stats['ctime']
					'exif-data': (result || false)
