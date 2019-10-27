# JVMKill Agent Buildpack

A [Cloud Native Buildpack](https://buildpacks.io) for providing [Cloud Foundry JVMKill Agent](https://github.com/cloudfoundry/jvmkill).


## Detection

The detection phase passes if 
* `BP_DISABLE_JVMKILL` is not set.

## Build

if the build plan contains

* `jvmkill`
  * Set `-agentpath` to `$JAVA_OPTS`
  * if `$BPL_JVMKILL_PARAMS` is specified, configures the [agent parameters](https://github.com/cloudfoundry/jvmkill#agent-parameters). Defaults to `-printHeapHistogram=1`.

## License
Licensed under the Apache License, Version 2.0.