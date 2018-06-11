@echo off

call %~dp0..\conf\insightedge-env.cmd

rem Figure out where the Spark framework is installed

if "x%SPARK_HOME%"=="x" (
  set SPARK_HOME="%XAP_HOME%\insightedge\spark"
)

call %SPARK_HOME%\bin\load-spark-env.cmd
set _SPARK_CMD_USAGE=Usage: bin\insightedge-pyspark.cmd [options]

rem Figure out which Python to use.

rem Load the InsighEdge version of shell.py script:
set OLD_PYTHONSTARTUP=%PYTHONSTARTUP%
set PYTHONSTARTUP=%XAP_HOME%\insightedge\bin\shell-init.py

call "%SPARK_HOME%\bin\spark-submit" pyspark-shell-main --name "PySparkShell" %*
