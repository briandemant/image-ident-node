exiftags = require 'exiftags'
fs = require 'fs'
exec = require('child_process').exec


exports.info = (path, callback) ->
	exports.basic path, (err, data)->
		return callback err if err
		exec "identify -format '%w %h %q %Q ' '" + path + "'", (error, info) ->
			console.log error if error
			[width, height, color, quality] = info.split(" ")
			exiftags.read path, (err, result) ->
				data['info'] =
					'width'     : width | 0
					'height'    : height | 0
					'colorspace': color | 0
					'quality'   : quality | 0
				data['exif-data'] = (result || false)

				callback null, data

# on linux the command is md5sum and on osx its md5
exports.md5 = (path, callback) ->
	cb = callback
	md5command = "md5sum"
	exec "#{md5command} '" + __filename + "'", (error, md5) ->
		md5command = "md5 -q" if error
		
		# we now know which one it is .. redefine md5 to use it
		exports.md5 = (path, cbk) ->
			exec "#{md5command} '" + path + "'", (error, md5) ->
				return cbk error if error
				cbk null, md5.split(" ")[0][0..-2]

		exports.md5 path, cb

# trigger detection call to lessen detection calls sitting on event que
exports.md5 __filename, ()->

exports.basic = (path, callback) ->
	fs.stat path, (err, stats) ->
		if err
			callback err
		else
			exports.md5 path, (error, md5) ->
				if error
					console.log error
					callback error
				else
					callback null,
						'stats':
							'size' : stats['size']
							'mtime': stats['mtime']
							'ctime': stats['ctime']
						'md5'  : md5 

