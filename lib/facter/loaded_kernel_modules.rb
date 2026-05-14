# frozen_string_literal: true

Facter.add(:loaded_kernel_modules) do
  confine kernel: 'Linux'
  setcode do
    File.readlines('/proc/modules')
        .map { |line| line.split.first }
        .sort
  end
end
