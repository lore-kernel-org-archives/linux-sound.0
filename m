Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594A40F8DF
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680318; cv=none; b=T71hqXLk6dxSBSxnHhwZHwq6amw9zZVJkV4d+aBPrxmM46J7wEiwWtzEqHDoxrvswR6Ic9k8kdF7ez7tSmLD5i6jY4FBLo+BwbjVqP3WaNFTjH7DErve6OnX9rFMA6OWdngqGlvGe9gslG8/9l6Rik7Zw0bCbfo5yFDvUAULBYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680318; c=relaxed/simple;
	bh=5rV2rI21VhZ4AqPpQN0h0i4VVnZtMGqIJQttR0mGQKM=;
	h=Message-ID:From:To:Cc:Subject:Date; b=frH+83OtQLplse93e+OGOxHwAjfDQjk4QdW6q8SqpNfiA+FZOGuFtKBdRcCOY+m2OCynfQGAk59xXZb+O2+mYSt3IG4MFzt6uniWuayIB0U3W9iUfDGvzsYejVZSO9q3yM/0mhXP0Tx1wM4W7VIIlgL7HaatKrxMV9U7nokhCdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ND4ie0Oc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND4ie0Oc"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 58F991F000E9;
	Fri, 10 Jul 2026 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783680315;
	bh=8QFS/UzOEfR7QT5s1IpcmXGVFQcaySqXOUnd6kbIuso=;
	h=From:To:Cc:Subject:Date;
	b=ND4ie0OcEYgYHAo6DaeDoEV/Z6xhdEZyW2/2ol+k0nAh3Q4BQbMrUZaUBpQbTnrUh
	 ZPjHkGIf9ciR4afz4x1561MXG3zsO/hP791/ULnwhJ5tWHwZwApJrmpfh6TfHmrtHf
	 ZFuheKTa1ItBH79nrkjVIZ2ludnYYNgnE8XWCdSwRMiQh9FDKWGkaOpJI/imIA3aLq
	 5vma2I8cwnK3sKddQ5dYhBydVgmEpsGNWh1QXABLnRaVPwggFra9vmalzAzIg1G48S
	 hD4Ep8arO+Ua0WZh0z6m+LigaBjjpHR55vKTAVly2MRXDbpKBruyaJH0IZHm7S6S8G
	 3dfrLBKFj+11Q==
Message-ID: <19b1f3ea7e0f08ad827d02c50075f69d@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.2-rc2
Date: Fri, 10 Jul 2026 11:45:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc2

for you to fetch changes up to 3238c634725afbb2a137fdda762208510828f71d:

  ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup (2026-07-09 00:33:20 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.2

A fairly standard set of device specific fixes and quriks for new
devices, nothing too remarkable here.

----------------------------------------------------------------
Baojun Xu (1):
      ASoC: amd: acp: amd-acp70-acpi-match: Add tas2783 support

Charles Keepax (1):
      ASoC: cs42l43: Correct report for forced microphone jack

Christian Hewitt (1):
      ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop

Maciej Strozek (1):
      ASoC: sof_sdw: Add a quirk for 0x17aa383c laptop using sidecar amps with cs42l43

Mark Brown (2):
      Vijendar Mukunda <Vijendar.Mukunda@amd.com> says:
      ASoC: qcom: Add Eliza audio support

Ravi Hothi (3):
      ASoC: dt-bindings: qcom: Add Eliza LPASS macro codecs
      ASoC: dt-bindings: qcom,sm8250: Add Eliza sound card
      ASoC: qcom: sc8280xp: Add support for Eliza

Syed Saba Kareem (1):
      ASoC: amd: acp: Fix linker error with SDCA quirks

Tianze Shao (1):
      ASoC: rt712-sdca: reset codec at io_init to fix silent headphone

Uday Khare (1):
      ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup

Vijendar Mukunda (3):
      ASoC: amd: ps: disable MSI on resume in ACP PCI driver
      ASoC: amd: ps: fix wrong ACP version string in pci_request_regions()
      ASoC: amd: ps: replace bitwise OR with logical OR in IRQ return check

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 sound/soc/amd/acp/Kconfig                          | 10 +++--
 sound/soc/amd/acp/Makefile                         |  3 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 47 +++++++++++++++++++++-
 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c       |  4 --
 sound/soc/amd/ps/pci-ps.c                          | 33 ++++++++++++++-
 sound/soc/codecs/cs42l43-jack.c                    |  3 +-
 sound/soc/codecs/rt712-sdca.c                      | 11 +++++
 sound/soc/codecs/tas2562.c                         |  5 ++-
 sound/soc/intel/boards/sof_sdw.c                   |  1 +
 sound/soc/meson/aiu-fifo-spdif.c                   |  5 +++
 sound/soc/qcom/sc8280xp.c                          |  1 +
 16 files changed, 113 insertions(+), 15 deletions(-)
