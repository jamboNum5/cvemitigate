# frozen_string_literal: true

Facter.add(:ca_certificates) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  confine kernel: 'Linux'

  setcode do
    version = Facter::Core::Execution.execute(
      "dpkg-query -W -f='${Version}' ca-certificates 2>/dev/null"
    )

    version.empty? ? 'not_installed' : version
  end
end
