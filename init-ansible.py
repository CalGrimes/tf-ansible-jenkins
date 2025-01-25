import os

public_ip = ""
inventory = ""

# Read public_ip.txt
with open('/tmp/public_ip.txt') as file:
  file.readline()
  public_ip = file.read().replaceAll('"', '')
  
  print("Python public_ip", public_ip)

# Read the inventory file
with open('ansible/inventory', 'r') as file:
  inventory = file.read()
  
# Substitute <host_ip> with the actual IP
inventory = inventory.replace('<host_ip>', public_ip)
  
# Write the modified content back to the inventory file
with open('ansible/inventory', 'w') as file:
  file.write(inventory)