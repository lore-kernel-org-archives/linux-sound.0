Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297945;
	b=m5DnKeoNUxTItDGjIw/EelfN2U+/L5RKRf2WeO20+hlJ96fKZqCchd7GDwQSmI4Wvc4/
	 wNMMNjNIB7czb7xjLKj6aRQD2HWF+V8OGTebJlXuwq35InGUtDS3g/Bp8asKDdEUpOxM6
	 YIgUVJD58CTMceitxLoXiQ2NSir+SumKogZYbNmvoaQQILfcjJkPlDrinJ8p8oMU2JCBo
	 ilkUrtoF3pdeZOzZy/TM3nfbQi3h6q3kQQ+iWlREutkEVJnVkav5RaGpdfTJDE+8ns4aB
	 RHo4PQIZKX7mNk0vKHNAp6PRCndSSubSHE7g34nu/7kfFdcP2GyiKyMhAsDUGS45lcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297945;
	h=Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:Date;
	bh=TMt4tok8EtivAf1je3I6wfcfe3Gi9bFIlhPwzfeT6EI=;
	b=fdaQVXKKN7hsYYhPAwsqioX3Tg9GeXdK9zOgP6Ohw3YrPwdSc7aOI2hiuJi4rh30aOwH
	 QI77WweupKTi9Ij2HWHfKMXXgOrR07lxmdEGfOsGnQbjbDxQQWbNpZMog+F8A6WxK187L
	 ptFHNnrfBpZYksnFRNXsikQ6szDPyOAULnqIQRUDD3pu+rfx58d+B5OBVcLGmhh7WJ3Jf
	 P50BYjvtrh8LFOekb3rqnXvvjiYu0Bqm3JsHCibvcjPOsjwuGfO6Ur4SfJ95os+w8a3c2
	 T0MI17/6IvmWvimoDxqb2dm4P60/RItCiDBpqa8Z+JeJt8tPH46bK/l6mLpUW4W2RaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AcO317Bk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id DCE18606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 18:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AcO317Bk
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E5CF11F01816;
	Thu, 29 Oct 2026 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793297944;
	bh=TMt4tok8EtivAf1je3I6wfcfe3Gi9bFIlhPwzfeT6EI=;
	h=From:To:Cc:Subject:Date;
	b=AcO317BkfglmuCWVcXoIgMsi49G392AHb5vTvJV9P9hMOJpAT3Udh5hHMpZTKWSL3
	 PSSKK6d3zAJJRhvHmyUZZm3OC7FpK+yAO/GWLN9YpgG3k1f5VtM+Y464LmJBPsN8yo
	 PRy+2fQs2UoXiypOkAIDRhxLeqd0gVCF32C60vwc9Kl3cqmo0U5hJdWpRzUx0LFgX7
	 XeWqWRhwxHBm/hoTNj+uhMarh3aF+UcDIRC+d6ymmR6XyeL7hBxkoHikbzRcLRbtNr
	 0Dpqg2kXQUuY9kIeVeD+RyvZ/3ivKf34h97HBaUwVdaXjR2exdBqImQa/5gDv3rTLz
	 35DLBnEmDh7YA==
Message-ID: <f3c0e30fe8b901ae314a5400bc8dda92@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.4-merge-window
Date: Thu, 29 Oct 2026 18:18:34 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The following changes since commit 73be2ee656f2722d498504259b9f1fdef8419431:

  ASoC: codecs: Fix more control definitions that write another control's bits (2026-10-18 13:22:10 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-merge-window

for you to fetch changes up to 11ae63bd9030349a0136fb2edd1622a4a029edc8:

  ASoC: SOF: Intel: hda: Stop the controller before freeing its DMA buffers (2026-10-29 11:41:21 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.4

A moderately large collection of fixes and quirks that have come in
during the merge window, everything here is driver specific and none of
it unusually severe.

----------------------------------------------------------------
Alex Kazinsky (1):
      ASoC: tlv320aic32x4: Prevent division by zero in divider callbacks

Arnd Bergmann (1):
      ASoC: SOF: amd: add ACPI dependency

Bard Liao (1):
      ASoC: soc-acpi-intel-arl-match: add rt712 on link 0 config

Chancel Liu (1):
      ASoC: imx-pcm-rpmsg: Flush pending work in hw_free

Fabio Estevam (1):
      ASoC: fsl_utils: Tolerate fractional PLL rate residue

Filippo Falezza (1):
      ASoC: qcom: sm8250: Limit RX digital gain to 0 dB

HyeongJun An (1):
      ASoC: cs42l56: Remove the ADC Mute Switch control

JJ Gault (1):
      ASoC: Intel: soc-acpi-intel-arl-match: Add RT713 + dual RT1320 support

Marek Szyprowski (6):
      ASoC: wm8994: fix MCLK gating for AIF clocks sourced from MCLK2
      ASoC: wm8994: don't lose the AIF clock ratio when staying at 32kHz SYSCLK
      ASoC: wm8994: fix MCLK index used for setting MCLK rate
      ASoC: samsung: midas_wm1811: run FLL1 at the AIF1 configured rate when idle
      ASoC: wm8994: follow AIF clock source changes in MCLK gating
      ASoC: codecs: wsa881x: Fix shared powerdown GPIO handling

Mark Brown (7):
      ASoC: wm8994/midas_wm1811: fix codec clocking issues
      ASoC: qcom: q6apm: Fix shared memory unmap
      ASoC: Intel: soc-acpi-intel-arl-match: add new
      ASoC: qcom: AudioReach and WSA88xx fixes
      ASoC: es9356-sdca: Modify the initialization and headphone-related settings
      ASoC: codecs: es*: controls that write each other's bits
      ASoC: hdac_hda: Fix module unbind/bind via sysfs

Oder Chiou (1):
      ASoC: rt721: Remove invalid register defaults

Peter Ujfalusi (4):
      ASoC: hdac_hda: Allocate the private data at codec driver bind
      ASoC: hdac_hda: Restore the codec device type on unbind
      ASoC: hdac_hda: Balance the runtime PM disable in codec remove
      ASoC: hdac_hda: Keep runtime PM state in sync across codec remove/probe

Ravi Hothi (3):
      ASoC: qcom: audioreach: fix module cfg blob size handling
      ASoC: codecs: wsa884x: Fix VI sense port channel count
      ASoC: codecs: wsa883x: Fix VI sense port channel count

Richard Fitzgerald (1):
      ASoC: cs35l56: Wait for firmware timer expiry before system suspend

Sasha Levin (1):
      ASoC: SOF: Intel: hda: Stop the controller before freeing its DMA buffers

Shawn Guo (3):
      ASoC: qcom: q6apm: Fix unmap regions response handling
      ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
      ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology

Shuming Fan (1):
      ASoC: rt722: enable mono speaker on Dell SKU 0EBA

Srinivas Kandagatla (7):
      ASoC: codecs: wsa884x: Accept temperatures across the full trim range
      ASoC: codecs: wsa883x: Accept temperatures across the full trim range
      ASoC: codecs: wsa884x: disable runtime PM on unbind
      ASoC: codecs: wsa883x: disable runtime PM on unbind
      ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
      ASoC: SDCA: drop pm_runtime reference on probe failure path
      ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure

Val Packett (1):
      ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for HP Laptop 14-em0xxx

Zhang Yi (6):
      ASoC: codecs: es8375: Modify Register Configuration
      ASoC: es9356-sdca: Modify the timing and configuration of headphone events
      ASoC: es9356-sdca: Add writeable_reg
      ASoC: es9356-sdca: Modify the Initialization Configuration
      ASoC: codecs: es*: Modify the registers related to ALC RECOVERY
      ASoC: codecs: es*: Modify the maximum value of DMIC_GAIN

bui duc phuc (2):
      ASoC: amd: raven: Fix memory leak in acp3x_dma_close()
      ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params

 include/sound/cs35l56.h                           |   4 +
 sound/soc/amd/raven/acp3x-pcm-dma.c               |   2 +
 sound/soc/amd/yc/acp6x-mach.c                     |   7 +
 sound/soc/codecs/cs35l56-sdw.c                    |  27 +++-
 sound/soc/codecs/cs35l56-shared.c                 |  38 ++++++
 sound/soc/codecs/cs35l56.c                        |  17 +++
 sound/soc/codecs/cs35l56.h                        |   1 +
 sound/soc/codecs/cs42l56.c                        |   1 -
 sound/soc/codecs/es8326.c                         |   2 +-
 sound/soc/codecs/es8375.c                         | 136 +++++++++----------
 sound/soc/codecs/es8375.h                         |   5 +-
 sound/soc/codecs/es9356.c                         | 106 +++++++++++----
 sound/soc/codecs/es9356.h                         |   5 +
 sound/soc/codecs/hdac_hda.c                       |  41 +++++-
 sound/soc/codecs/rt721-sdca-sdw.c                 |   2 -
 sound/soc/codecs/rt721-sdca-sdw.h                 |   4 -
 sound/soc/codecs/rt722-sdca.c                     |  18 +++
 sound/soc/codecs/rt722-sdca.h                     |   2 +
 sound/soc/codecs/tlv320aic32x4-clk.c              |   8 +-
 sound/soc/codecs/wm8994.c                         | 153 ++++++++++++----------
 sound/soc/codecs/wm8994.h                         |   2 +
 sound/soc/codecs/wsa881x.c                        |  18 ++-
 sound/soc/codecs/wsa883x.c                        |  21 +--
 sound/soc/codecs/wsa884x.c                        |  19 +--
 sound/soc/fsl/fsl_utils.c                         |  25 +++-
 sound/soc/fsl/imx-pcm-rpmsg.c                     |  14 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c |  84 ++++++++++++
 sound/soc/qcom/qdsp6/q6afe.c                      |  10 +-
 sound/soc/qcom/qdsp6/q6apm.c                      |  49 +++++--
 sound/soc/qcom/qdsp6/topology.c                   |  31 ++++-
 sound/soc/qcom/sm8250.c                           |  10 ++
 sound/soc/samsung/midas_wm1811.c                  |  14 +-
 sound/soc/sdca/sdca_class.c                       |  10 +-
 sound/soc/sof/amd/Kconfig                         |   1 +
 sound/soc/sof/intel/hda-codec.c                   |  23 +---
 sound/soc/sof/intel/hda-ctrl.c                    |   1 +
 sound/soc/sof/intel/hda.c                         |   4 +
 sound/soc/xilinx/xlnx_formatter_pcm.c             |  18 +--
 38 files changed, 685 insertions(+), 248 deletions(-)
