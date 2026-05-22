# Linux System Metrics Automation Daemon

A native, lightweight background monitoring suite built from scratch to track essential server infrastructure diagnostics (CPU usage, Memory utilization, Disk space, and top active Process IDs) in a perfectly aligned, live-updating terminal grid.

The project includes an automatic warning threshold that flags high CPU utilization and is fully integrated with `systemd` to run as a native, self-healing background service daemon.

## 🚀 Key Functional Features
* **Real-Time Resource Diagnostics:** Dynamically monitors active processor loads, volatile memory pools, and root disk storage limits.
* **Smart Performance Threshold Alerts:** Instantly logs high-priority warning markers into persistent ledgers the exact moment CPU utilization breaches the 85% safety threshold.
* **Bottleneck Tracking:** Pinpoints and surfaces the top resource-heavy background processes running on the machine, giving immediate insight into system strain.
* **Immutable Grid Formats:** Avoids messy terminal text alignment shifting by utilizing fixed-width tracking grids for premium human-readability.
* **Resilient Background Operation:** Automatically hooks into system boot protocols via a customized `systemd` unit with automated crash-recovery parameters.

---

## 📂 Project Repository Structure
```text
system-metrics-daemon/
├── README.md                 
├── dashboard-monitor.service   # Systemd service configurations template
├── monitoring/
│   ├── logfile                 # Generated human-readable metrics ledger
│   └── monit.sh                # Main workflow orchestrator script
└── metric_collection/
    ├── cpu.sh                  # CPU parsing calculation module
    ├── memory.sh               # Memory tracking utility module
    └── top_proc.sh             # High-utilization process finder module
