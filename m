Received: from mail-m155105.qiye.163.com (mail-m155105.qiye.163.com [101.71.155.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8924E351C2D
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 03:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786591282; cv=none; b=AQHMSrBvAGIdRs1j7N0ZuLQNx5u0S/+Te1Z2MOuckz/jX0ByO0CYNct6I/SFtQaM1d3rMxHrY/5cOsE14KKF0OPHSHTy+5x79VoHMkvbFH6Hnk9K8ZOuDKkH7nwhYHxwnjnXA5Xz0j7dehJFn9AYrKbyh6naNkR0g/XURILvIv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786591282; c=relaxed/simple;
	bh=D4l/jtQwlNzCp93Fi9nGk6Nme52if5DOxu6UlGz6AvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iq3YDxNbZGmhFxFkPdorlRQYfyFRy+h2zpNZFGInpeQHWbKr5OY3V2L/xzbpURtXWQdVeuYB2PFke3N69S0TNt2MEzynoqIO7Pz+QRZ2nKQCEupZeRCevkw3d17Gke/MeVPcb57bvAdmD/1FiagShuVMudciHCH01IBQJo3q8W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=RlX13IAC; arc=none smtp.client-ip=101.71.155.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="RlX13IAC"
Received: from localhost.localdomain (unknown [182.148.129.16])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49cdb6453;
	Thu, 13 Aug 2026 10:45:43 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: Qianghua Wang <qianghua.wang@senarytech.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH v2 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Thu, 13 Aug 2026 10:45:24 +0800
Message-ID: <20260813024527.42294-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ff902e08f09d8kunm5727fec547de7b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGBgfVkwaGh9JSB0dGUMZGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVKTVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=RlX13IACfahXimmmdosN+Os8K8qe5vRZt1w85XFzkxowqOZlI0EDL5g5vdLTyrDlXmKnxDtvHvco3ZLqFaULtgcyLHTrtkg7S8EZx1sKxp1q1jkJDflXxH31+XV/axACUCT+rjPdb9+BJWdlPnCxGeaJiiPeGbz12eVTkUK88DM=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=OxzK2P78K3P9DwtJReyvoZBlEeOpY4A+0rzuQqhb2V8=;
	h=date:mime-version:subject:message-id:from;

This series adds SoundWire SDCA support for Senary SN624x
multi-function codecs (jack, speaker amp, DMIC) on Intel ARL,
LNL, MTL, and PTL.

Changes since v1:
- Rebase onto current tiwai/sound for-next.
- Fix author name to "Qianghua Wang".
- Drop debug module parameters; use dynamic_debug instead.
- Remove one-shot power_mode debug helper.
- Program SDCA SampleFreqIndex in hw_params.
- Fix system_suspend: mask/disable IRQ before cancelling jack work.
- Rename userspace-facing prefix from sn6242 to sn624x.
- Kconfig/Makefile lexicographic sort; depends on SND_SOC_SDCA.
- Id-table sentinel "{ }"; drop unused mod_devicetable.h include.
- Add ACPI match entries for ARL/LNL/MTL (in addition to PTL).

Patch summary:
  1/3  codec driver + MAINTAINERS
  2/3  sdw_utils helpers and codec_info
  3/3  Intel ARL/LNL/MTL/PTL ACPI match + SOF mach select

Validated on LG Wildcat Lake / PTL with part_id 0x6247
(MODALIAS sdw:m0496p6247v03c01).

Qianghua Wang (3):
  ASoC: codecs: add SN624x SDCA SoundWire driver
  ASoC: sdw_utils: add Senary SN624x helpers and codec_info
  ASoC: Intel: soc-acpi: add SN624x entries for ARL/LNL/MTL/PTL

 MAINTAINERS                                   |    3 +
 include/sound/soc_sdw_utils.h                 |   20 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sn624x-sdca-sdw.c            | 1833 +++++++++++++++++
 sound/soc/codecs/sn624x-sdca.h                |  150 ++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-arl-match.c   |   71 +
 .../intel/common/soc-acpi-intel-lnl-match.c   |   71 +
 .../intel/common/soc-acpi-intel-mtl-match.c   |   71 +
 .../intel/common/soc-acpi-intel-ptl-match.c   |   82 +
 sound/soc/sdw_utils/Makefile                  |    4 +-
 sound/soc/sdw_utils/soc_sdw_senary_amp.c      |   80 +
 sound/soc/sdw_utils/soc_sdw_senary_dmic.c     |   49 +
 sound/soc/sdw_utils/soc_sdw_senary_sdca.c     |   63 +
 .../soc_sdw_senary_sdca_jack_common.c         |  197 ++
 sound/soc/sdw_utils/soc_sdw_utils.c           |  166 ++
 17 files changed, 2875 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/sn624x-sdca-sdw.c
 create mode 100644 sound/soc/codecs/sn624x-sdca.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_amp.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_dmic.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

-- 
2.47.3
