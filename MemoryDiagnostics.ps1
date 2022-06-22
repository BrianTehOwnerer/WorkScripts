#Quick 1 liner to get Windows Memory Diagnostics results out of the event vewer
#All the other ones online use all kinds of weird tricks to match the right log file.
get-eventlog -logname system -Source "Microsoft-Windows-MemoryDiagnostics-Results"