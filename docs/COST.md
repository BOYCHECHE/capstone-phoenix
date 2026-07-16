# Cost

This echoes the Docker lesson's "why one server" thread — except now the answer to "is the extra cost worth it?" is yours to argue.

## Monthly itemized cost

| Item | Spec | Qty | $/mo |
|---|---|---:|---:|
| control-plane VM | AWS t3.medium (2 vCPU, 4GB RAM) | 1 | $30.24 |
| worker VMs | AWS t3.small (2 vCPU, 2GB RAM) | 2 | $30.24 |
| load balancer / elastic IP | AWS Managed NAT Gateway + Elastic IP | 1 | $32.40 |
| block storage (PVC) | gp3 SSD Storage (20 GB per node) | 3 | $4.80 |
| object storage (state, backups)| S3 Remote Terraform State Bucket | 1 | $1.00 |
| DNS / domain | Custom Registration TLD (.dev / .com) | 1 | $1.00 |
| **Total** | | | **$99.68** |

## Compared to the single-server Compose+Portainer deploy
- That stack cost roughly: $15.12 / mo (A single, unbacked t3.small instance running Docker Compose).
- This cluster costs: $99.68 / mo
- **What the extra spend buys**: The extra spend completely eliminates single points of failure. If a physical VM hardware instance dies or suffers a network drop on AWS, our pod anti-affinity configurations and cluster scheduler will instantly move and restart workloads on the remaining healthy VM within seconds. It guarantees multi-replica high-availability, zero-downtime rolling deployment upgrades via rolling update rules, automated database storage decoupling via StatefulSets, and declarative self-healing driven by GitOps. It is NOT worth it for early stage proofs-of-concept, internal staging tools, hobby applications, or minimal traffic sites where an hour of manual downtime carries zero business cost.

## How I'd halve this
To cut this infrastructure budget in half, I would migrate the entire architecture from AWS to an entry-level alternative cloud provider such as Hetzner or DigitalOcean. Running three 4GB cloud VMs on Hetzner costs roughly $15.00 total per month. Additionally, I would completely remove the costly managed AWS NAT Gateway ($32.40/mo) and instead assign public IPv4 tracking addresses directly to the cluster worker instances paired with strict, locked-down cloud security group rules. These two simple structural modifications would immediately slash our monthly expenditure from $99.68 to under $22.00 without dropping our true multi-node high-availability capabilities.

