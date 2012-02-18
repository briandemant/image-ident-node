(function() {
  var exiftags, fs;

  exiftags = require('exiftags');

  fs = require('fs');

  exports.info = function(path, callback) {
    return exiftags.tags(path, function(err, result) {
      return fs.stat(path, function(err, stats) {
        return callback(null, {
          'stats': {
            'size': stats['size'],
            'mtime': stats['mtime'],
            'ctime': stats['ctime']
          },
          'exif-data': result
        });
      });
    });
  };

}).call(this);
