# Kubernetes高可用部署工具

[![](https://img.shields.io/badge/Proxy-iptables-blue.svg?style=flat-square)](#)
[![](https://img.shields.io/badge/Proxy-IPVS-blue.svg?style=flat-square)](#)
[![](https://img.shields.io/badge/DNS-CoreDNS-brightgreen.svg?style=flat-square)](#)
[![](https://img.shields.io/badge/Net-Flannel-violet.svg?style=flat-square)](#)
[![](https://img.shields.io/badge/Net-Calico-violet.svg?style=flat-square)](#)
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg?style=flat-square)](https://github.com/TimeBye/Kubernetes/blob/master/LICENSE)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FTimeBye%2FKubernetes.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2FTimeBye%2FKubernetes?ref=badge_shield)

> **🎉 本项目受 [kubeasz](https://github.com/easzlab/kubeasz) 启发，考虑使用二进制进行安装的用户可以参考该项目。**

**Kubernetes高可用部署工具** 是一个基于 [Ansible](https://www.ansible.com/) 的 Kubernetes 高可用集群自动化部署和管理工具。它使用 [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/) 作为底层部署引擎，通过精心设计的 Ansible Playbook 和 Role，实现了从零开始到生产级 Kubernetes 高可用集群的全流程自动化部署。

## 🚀 项目特性

- **🏗️ 高可用保障**: 支持多 Master 节点的高可用架构，确保集群稳定性
- **⚖️ 多种负载均衡模式**: 支持 nginx、haproxy、keepalived 等多种负载均衡方案
- **📦 容器运行时支持**: 同时支持 Docker 和 containerd 容器运行时
- **🔗 网络插件可选**: 支持 Calico 和 Flannel 网络插件
- **🔒 全生命周期管理**: 从安装、扩容、升级到备份恢复的全流程自动化
- **💾 离线部署**: 支持完全离线环境下的集群部署
- **🔐 证书管理**: 自动化的 TLS 证书生成、分发和轮换
- **🛡️ 安全加固**: 支持 TLS 双向认证、自定义证书有效期、RBAC 授权
- **📊 网络策略**: 支持 Network Policy，提供网络隔离能力

## 📋 分支说明

- **`release-*`**: 安装对应版本的 Kubernetes（推荐使用）
- **`develop`**: 开发分支，包含最新特性但不建议生产使用

## 🌟 技术栈支持

<table>
    <thead>
        <tr>
            <th align="left"><strong>类别</strong></th>
            <th align="left"><strong>支持版本</strong></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="left">系统架构</td>
            <td align="left">amd64, arm64</td>
        </tr>
        <tr>
            <td align="left">操作系统</td>
            <td align="left">
              RedHat 7+               <br>
              Rocky Linux 8, 9        <br>
              CentOS 7.9, 8          <br>
              Debian 11, 12           <br>
              Ubuntu 20.04+           <br>
              Kylin V10               <br>
              Anolis OS 8             <br>
              OpenEuler 21.09+
            </td>
        </tr>
        <tr>
            <td align="left">Etcd</td>
            <td align="left">3.5.12-0</td>
        </tr>
        <tr>
            <td align="left">容器运行时</td>
            <td align="left">Docker, <strong>containerd</strong></td>
        </tr>
        <tr>
            <td align="left">Kubernetes</td>
            <td align="left">v1.20~v1.30 (<strong>默认 v1.30</strong>)</td>
        </tr>
        <tr>
            <td align="left">API Server 负载均衡</td>
            <td align="left">slb, haproxy, <strong>nginx</strong></td>
        </tr>
        <tr>
            <td align="left">网络插件</td>
            <td align="left">flannel, <strong>calico</strong></td>
        </tr>
        <tr>
            <td align="left">Ingress 控制器</td>
            <td align="left">traefik, <strong>nginx-ingress</strong></td>
        </tr>
    </tbody>
</table>

> **注意**: 表格中粗体标识的为默认安装版本

## ⚠️ 已知问题

- 由于各插件（Network plugin、Ingress controller）版本更新可能不再兼容低版本 kubernetes，若在部署时指定了低版本 kubernetes 可能导致插件部署时报错。建议安装本项目默认或最新版本 kubernetes。相关讨论请参与 [#28](https://github.com/TimeBye/Kubernetes/issues/28)。

## 📚 使用指南

<table>
    <tr>
        <td><a href="docs/00-安装须知.md">📋 安装须知</a></td>
        <td><a href="docs/01-集群安装.md">🚀 集群安装</a></td>
        <td><a href="docs/02-节点管理.md">🔧 节点管理</a></td>
        <td><a href="docs/03-证书轮换.md">🔐 证书轮换</a></td>
        <td><a href="docs/04-集群升级.md">⬆️ 集群升级</a></td>
    </tr>
    <tr>
        <td><a href="docs/05-集群备份.md">💾 集群备份</a></td>
        <td><a href="docs/06-集群恢复.md">🔄 集群恢复</a></td>
        <td><a href="docs/07-集群重置.md">🔄 集群重置</a></td>
        <td><a href="docs/08-离线安装.md">📦 离线安装</a></td>
        <td><a href="docs/09-扩展阅读.md">📖 扩展阅读</a></td>
    </tr>
</table>

## 🎬 安装演示

[![asciicast](https://asciinema.org/a/254490.svg)](https://asciinema.org/a/254490)

## 🚀 快速开始

### 1. 环境准备

```bash
# 安装 Ansible 运行环境
sudo ansible/install.sh

# 克隆项目
git clone -b release-1.30 https://github.com/TimeBye/Kubernetes.git
cd Kubernetes
```

### 2. 配置清单

编辑 `example/hosts.m-master.ip.ini` 文件，配置你的节点信息：

```ini
[all]
node1 ansible_host=192.168.1.10 ansible_user=root ansible_ssh_pass=password
node2 ansible_host=192.168.1.11 ansible_user=root ansible_ssh_pass=password
node3 ansible_host=192.168.1.12 ansible_user=root ansible_ssh_pass=password

[etcd]
node1
node2
node3

[kube-master]
node1
node2
node3

[kube-worker]
node1
node2
node3
```

### 3. 部署集群

```bash
# 基本部署
ansible-playbook -i example/hosts.m-master.ip.ini 90-init-cluster.yml

# 高级配置部署（可选）
ansible-playbook -i example/hosts.m-master.ip.ini -e @example/variables.yaml 90-init-cluster.yml
```

## 👥 项目贡献者

<table><tr>

   <td align="center">
  <a href="https://github.com/carllhw"><img src="https://avatars2.githubusercontent.com/u/9696301?s=400&v=4" width="100px;" alt="carllhw"/>
   <br></br><sub><b>carllhw</b></sub>

   <td align="center">
  <a href="https://github.com/Jaywoods2"><img src="https://avatars2.githubusercontent.com/u/18679696?s=400&v=4" width="100px;" alt="Jaywoods2"/>
  <br></br><sub><b>Jaywoods2</b></sub>

   <td align="center">
  <a href="https://github.com/ChongmingDu"><img src="https://avatars.githubusercontent.com/u/22591706?s=400&v=4" width="100px;" alt="ChongmingDu"/>
  <br></br><sub><b>ChongmingDu</b></sub>
  
   <td align="center">
  <a href="https://github.com/happinesslijian"><img src="https://avatars2.githubusercontent.com/u/47111417?s=400&v=4" width="100px;" alt="happinesslijian"/>
  <br></br><sub><b>happinesslijian</b></sub>

   <td align="center">
  <a href="https://github.com/zlingqu"><img src="https://avatars1.githubusercontent.com/u/41672611?s=400&v=4" width="100px;" alt="zlingqu"/>
  <br></br><sub><b>zlingqu</b></sub>

   <td align="center">
  <a href="https://github.com/li-sen"><img src="https://avatars.githubusercontent.com/u/33471335?s=400&v=4" width="100px;" alt="li-sen"/>
  <br></br><sub><b>li-sen</b></sub>

</td></tr></table>

## 💖 致谢

### JetBrains 开源证书支持

**Kubernetes高可用部署工具** 基于 **free JetBrains Open Source license(s)** 正版免费授权进行开发，在此表达我们的谢意。

<a href="https://www.jetbrains.com/?from=Kubernetes" target="_blank"><img src="https://raw.githubusercontent.com/panjf2000/illustrations/master/jetbrains/jetbrains-variant-4.png" width="250" align="middle"/></a>

## 📄 许可证

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FTimeBye%2FKubernetes.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FTimeBye%2FKubernetes?ref=badge_large)

## 🤝 社区与支持

- **Issues**: [报告问题](https://github.com/TimeBye/Kubernetes/issues)
- **Discussions**: [参与讨论](https://github.com/TimeBye/Kubernetes/discussions)
- **Wiki**: [查看文档](https://github.com/TimeBye/Kubernetes/wiki)

## ⭐ 如果这个项目对你有帮助，请给我们一个 Star！

---

<p align="center">
  <i>让 Kubernetes 高可用部署变得简单高效</i>
</p>