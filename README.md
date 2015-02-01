Super Simple Build Server  [![GoDoc](https://godoc.org/github.com/ian-kent/ssbs?status.svg)](https://godoc.org/github.com/ian-kent/ssbs) [![Build Status](https://travis-ci.org/ian-kent/ssbs.svg?branch=master)](https://travis-ci.org/ian-kent/ssbs)
=========================

An incredibly simple build server.

Current features:
- Build from GitHub using SSH (must work using `git clone` without passwords)
- Build a specific branch, tag or commit
- Specify custom build commands

Install ssbs:
```
go get github.com/ian-kent/ssbs
```

Start the server:
```
ssbs
```

Build something:
```
curl -v -d '{"repo":"ian-kent/ssbs","commit":"master","steps":[ ["make"], ["make","dist"] ], "output": "ssbs-*.zip" }' http://localhost:5252/build
```

And get back the artifacts:
```json
{
  "steps": [
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
    "ssbs-1.0.0.zip": "BASE64_ENCODED_DATA"
  }
}
```

### Licence

Copyright ©‎ 2015, Ian Kent (http://www.iankent.eu).

Released under MIT license, see [LICENSE](LICENSE.md) for details.
