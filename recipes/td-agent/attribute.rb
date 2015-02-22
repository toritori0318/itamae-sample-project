node["td_agent"] = node["td_agent"] || {}

node['td_agent']['includes'] = node['td_agent']['includes'] || []
node["td_agent"]["plugins"]  = node['td_agent']['plugins'] || %w{
  forest
}
