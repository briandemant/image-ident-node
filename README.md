Image ident for node.js
=============

.. later


Usage
-----

	var image_ident = require('image-ident');

	image_ident.info path_to_file, function(err, data) {
		if (err) throw err;
		console.log data;
	}

if the image contains exif data then data will be as

	{
		stats: {
			size: 1699551,
			mtime: new Date('2007-09-21 11:04:30'),
			ctime: new Date('2007-09-19 14:04:30')
		},
		'exif-data': {
			'Camera Software': 'Adobe Photoshop CS3 Windows',
			'Image Orientation': 'Top, Left-Hand',
			'Horizontal Resolution': '72 dpi',
			'Vertical Resolution': '72 dpi',
			'Image Created': new Date('2007-09-19 14:04:30'),
			'Color Space Information': 'Uncalibrated',
			'Image Width': 6400,
			'Image Height': 3200,
			'Resolution Unit': 'i',
			'Exif IFD Pointer': 164,
			'Compression Scheme': 'JPEG Compression (Thumbnail)',
			'Offset to JPEG SOI': 302,
			'Bytes of JPEG Data': 4608
		}
	}

else exif-data will be **false**

	{
		stats: {
			size: 8867,
			mtime: new Date('2007-09-21 11:04:30'),
			ctime: new Date('2007-09-18 14:33:30')
		},
		exif-data': false
	}


Installation
-----------

.. later

Testing
-------

the tests are written in mocha and uses expect.js

    mocha spec/image-ident.spec.coffee


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_branch`)
3. Commit your changes (`git commit -am "Added a sweet feature!"`)
4. Push to the branch (`git push origin my_branch`)
5. Send a pull request
6. Enjoy a refreshing Cup of Coffee® and wait