# frozen_string_literal: true

Facter.add(:cve_2026_31431) do
  setcode do
    file_path = '/tmp/cve_2026_31431.test'
    if File.exist?(file_path)
      if File.size(file_path) > 0
        false
      else
        true
      end
    end
  end
end
