# デフォルトattribute
node.reverse_merge!(
  td_agent: {
    includes: [],
    plugins: %w{
      forest
    },
  },
)

# node.reverse_merge! は以下と同じようなことを実現している
#
#   node["td_agent"] = node["td_agent"] || {}
#   node['td_agent']['includes'] = node['td_agent']['includes'] || []
#   node["td_agent"]["plugins"]  = node['td_agent']['plugins'] || %w{
#     forest
#   }
#
