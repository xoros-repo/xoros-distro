var Reposync = require('node-reposync')

var sync = new Reposync.Sync()

console.log(sync.doSync({}));

