module Awspec::Type
  class LaunchTemplate < ResourceBase
    tags_allowed

    def resource_via_client
      @resource_via_client ||= find_launch_template(@display_name)
    end

    def id
      @id ||= resource_via_client.launch_template_id if resource_via_client
    end

    def has_version_number?(version_number)
      launch_template_versions = find_launch_template_versions(@id)
      launch_template_versions.launch_template_versions.each do |launch_template_version|
        return true if launch_template_version.version_number.to_s == version_number.to_s
      end
    end
  end
end