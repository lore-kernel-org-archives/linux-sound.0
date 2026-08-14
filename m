Received: from mail-m1973191.qiye.163.com (mail-m1973191.qiye.163.com [220.197.31.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0ED33B6D6
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 04:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786680782; cv=none; b=lWUhoHBE04ngyZDhCB8slwLlyGJ+/qtTtdIwQAejUHUqZ7N2+7VHVHU/KUGSnnvO7pK7JAijkZBvWylFAFd52XanDE8vfdrFKQH6OlgutOTcZafhgqGnRRnuhiNB+fKQXbcTngOxTnz5KLu7XY2PdS5m/OlugI83rXvoS4C7Cyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786680782; c=relaxed/simple;
	bh=qE80S4kB7zRodXrqy0tyr5VSF2hAz72d4Qy5ftKHaqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDkn3TWBQFrgKU9ggUW2wQZdJd/EXF1R0QpQoPe0CBBX71wWwHFDrRCqZBdy+aCH7uinDMNnH2nbva06+OoeGWN+VfB3e0cBmhGV5Zm5IYz0C4K2voNU+2TzWrd1cgJJKQ9BvG1cTeT5cS9VcyDLdU0lWW9iRX6BndW5UJ1aHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=Z4kncRYg; arc=none smtp.client-ip=220.197.31.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="Z4kncRYg"
Received: from localhost.localdomain (unknown [182.148.129.16])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49f34a1f1;
	Fri, 14 Aug 2026 10:57:08 +0800 (GMT+08:00)
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
Subject: [PATCH v3 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Fri, 14 Aug 2026 10:56:47 +0800
Message-ID: <20260814025653.5484-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ffe33b03709d8kunm6842316c540408
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQkwdVkkfTUkfTkNIQ0JOSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVKTVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Z4kncRYgeIPguLp5CuJXgXNMOz6WUKyWlkJDAHFpAykKyXzAYK0Vl6t2PnjOvsqb7Yr/RhVsMq4TzwlGlZmJ43p90Qtp9f8Lo/CzMAqxekmnEo/d+1PNU9PAuhoJMqKF08et4wz3S4Cd4/uKamNgn5lW5vOgRsCzyudDOrPMfug=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=TNdrUq33iwAN+L32pxElxdfP8l9XgOSuEAkcnwh698M=;
	h=date:mime-version:subject:message-id:from;

This series adds SoundWire SDCA support for Senary SN624x
multi-function codecs (jack, speaker amp, DMIC) on Intel ARL,
LNL, MTL, and PTL.

Changes since v2:
- Propagate io_init Function Status / defaults failures instead of
  skipping init and still returning success.
- Zero-initialize sdw stream/port configs and use
  snd_sdw_params_to_config().
- Program jack SampleFreqIndex only for the configured stream
  direction (avoid forcing symmetric rates).
- Mark regmap cache dirty on suspend and on re-io_init after
  re-attach so regcache_sync restores state after power loss/reset.
- Hold a long-lived runtime PM get while jack detect is enabled
  via set_jack / remove (drop poll mark_last_busy refresh).
- Use sdw_slave_wait_for_init() on resume when unattach_request
  is set.

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
 sound/soc/codecs/sn624x-sdca-sdw.c            | 1865 +++++++++++++++++
 sound/soc/codecs/sn624x-sdca.h                |  152 ++
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
 17 files changed, 2908 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/sn624x-sdca-sdw.c
 create mode 100644 sound/soc/codecs/sn624x-sdca.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_amp.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_dmic.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

-- 
2.47.3
