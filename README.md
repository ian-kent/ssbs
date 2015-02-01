Super Simple Build Server  [![GoDoc](https://godoc.org/github.com/ian-kent/ssbs?status.svg)](https://godoc.org/github.com/ian-kent/ssbs) [![Build Status](https://travis-ci.org/ian-kent/ssbs.svg?branch=master)](https://travis-ci.org/ian-kent/ssbs)
=========================

An incredibly simple build server.

**WARNING** Don't run this in the wild! ANY command can be passed as a step.

Current features:
- Build from GitHub (must work using `git clone` without passwords)
  - Either pre-configure SSH
  - Or use an OAuth token in the build request
- Build a specific branch, tag or commit
- Specify custom build and publish steps

Install ssbs:
```bash
go get github.com/ian-kent/ssbs
```

Start the server:
```bash
# Default port 5252
ssbs

# Custom interface/port
ssbs -bind=:5353
```

Build something:
```bash
curl -v -d '{"repo":"ian-kent/ssbs","commit":"master","build":[ ["make"], ["make","dist"] ], "artifacts": "ssbs-*.zip" }' http://localhost:5252/build
```

Or build something using HTTPS:
```bash
curl -v -d '{"repo":"ian-kent/ssbs","commit":"master","build":[ ["make"], ["make","dist"] ], "artifacts": "ssbs-*.zip", "token": "-" }' http://localhost:5252/build
```

Or build something with a GitHub token:
```bash
curl -v -d '{"repo":"ian-kent/ssbs","commit":"master","build":[ ["make"], ["make","dist"] ], "artifacts": "ssbs-*.zip", "token": "YOUR-GITHUB-TOKEN" }' http://localhost:5252/build
```

Or build something with publish steps:
```bash
curl -v -d '{"repo":"ian-kent/ssbs","commit":"master","build":[ ["make"], ["make","dist"] ], "publish":[ ["echo", "hi"] ] "artifacts": "ssbs-*.zip" }' http://localhost:5252/build
```

And get back the artifacts:
```json
{
  "build": [
    {
      "step": ["make"],
      "stdout": "",
      "stderr": "",
      "error": "",
    },
    {
      "step": ["make", "dist"],
      "stdout": "",
      "stderr": "",
      "error": "",
    }
  ],
  "artifacts": {
    "ssbs-1.0.1.zip": "BASE64_ENCODED_DATA"
  }
}
```

### Using Marathon

If you're using Mesos and Marathon, you can easily start ssbs:

Command:

`./ssbs -bind=:$PORT`

URI:

`https://github.com/ian-kent/ssbs/releases/download/v1.0.3/ssbs-1.0.3_linux_amd64.zip`

### Licence

Copyright ©‎ 2015, Ian Kent (http://www.iankent.eu).

Released under MIT license, see [LICENSE](LICENSE.md) for details.
