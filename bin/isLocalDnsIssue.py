import subprocess
import socket

# TODO: Change interface of swichting DNS servers to ask if we prefer google's DNS or empty (custom, defaulting to gateway) DNS
# networksetup -setdnsservers Wi-Fi 8.8.8.8  8.8.4.4
# networksetup -setdnsservers Wi-Fi "empty"
# networksetup -getdnsservers Wi-Fi

def ping_host(host):
    result = subprocess.run(["ping", "-c", "1", host], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    return result.returncode == 0

def check_dns(domain):
    try:
        return socket.gethostbyname(domain)
    except socket.gaierror:
        return None

def get_current_ip():
    output = subprocess.check_output(["bash", "-c", "ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}'"])
    return output.decode().strip()

def get_subnet(ip_address):
    return ".".join(ip_address.split(".")[:3]) + ".0/24"

google_dnses = ["8.8.8.8", "8.8.4.4"]
interface = "Wi-Fi"
domains = ["wp.pl", "google.com"]

if __name__ == "__main__":
    for host in google_dnses:
        if ping_host(host):
            print(f"{host} is reachable")
        else:
            print(f"{host} is not reachable")

    for domain in domains:
        ip_address = check_dns(domain)
        if ip_address is not None:
            print(f"{domain} resolves to {ip_address}")
        else:
            print(f"{domain} does not resolve")

    dns_servers = []
    with open("/etc/resolv.conf") as f:
        for line in f:
            if line.startswith("nameserver"):
                ip_address = line.strip().split()[1]
                if ":" not in ip_address:  # Filter out IPv6 addresses - ipv6 is not supported yet
                    dns_servers.append(ip_address)

        print(f"Currently set DNS: {', '.join(dns_servers)}")
        current_ip = get_current_ip()
        print(f"Current IP: {current_ip}")
        current_subnet = get_subnet(current_ip)
        print(f"Current subnet: {current_subnet}")
        print(f"Current DNS's subnets: {', '.join([get_subnet(dns_server) for dns_server in dns_servers])}")
        if current_subnet in [get_subnet(dns_server) for dns_server in dns_servers]:
            print("DNS is on the same subnet as current IP")
        else:
            print("DNS is not on the same subnet as current IP")
            print("Reseting and switching to google's DNS")
            subprocess.run(["networksetup", "-setdnsservers", interface, "empty"])
            subprocess.run(["networksetup", "-setdnsservers", interface] + google_dnses)
            result = subprocess.run(["networksetup", "-getdnsservers", interface], capture_output=True)
            output = result.stdout.decode().strip()
            print("Setted DNS: ", output)
