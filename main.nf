#!/usr/bin/env nextflow



println """\
=================================
         STRESS TEST
=================================
Workflow Information:
---------------------
  Project Directory:  ${workflow.projectDir}
  Launch Directory:   ${workflow.launchDir}
  Work Directory:     ${workflow.workDir}
  Config Files:       ${workflow.configFiles}
  Container Engine:   ${workflow.containerEngine}
  Profiles:           ${workflow.profile}
Execution Parameters:
---------------------
stress-test
  processes:       ${params.stress.processes}
  time:       ${params.stress.time}
"""

/**
 *  Process that instantiates a specified number of processes for a specified period of time.
 */
process stress_test {
	tag "process/${index}"
		
        input:
		each(index) from Channel.from( 0 .. params.stress.processes-1 )

	script:
		"""
		sleep ${params.stress.time}
		"""
}
