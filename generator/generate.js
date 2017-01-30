let fs = require('fs')

grav_versions = [
  '1.1.14',
  '1.1.15'
]

fs.readFile('Dockerfile.template', 'utf8', function(err, data) {
  // Regular versions
  grav_versions.map(function(grav_version, index) {
    fs.mkdir('../dockerfiles/base/' + grav_version, function(e) {
      var dockerfileText = data.replace('${grav_version}', grav_version);
      dockerfileText =  dockerfileText.split('${directoryInZip}').join('')
      fs.writeFile('../dockerfiles/base/' + grav_version + '/Dockerfile', dockerfileText);
      if (index === grav_versions.length - 1) {
        fs.writeFile('../dockerfiles/base/Dockerfile', dockerfileText);
      }
    })
  });
  // Admin versions
  grav_versions.map(function(grav_version, index) {
    fs.mkdir('../dockerfiles/admin/' + grav_version, function(e) {
      var dockerfileText = data.replace('${grav_version}', grav_version);
      dockerfileText = dockerfileText.split('${directoryInZip}').join('-admin')
      fs.writeFile('../dockerfiles/admin/' + grav_version + '/Dockerfile', dockerfileText);
      if (index === grav_versions.length - 1) {
        fs.writeFile('../dockerfiles/admin/Dockerfile', dockerfileText);
      }
    })
  });
})


