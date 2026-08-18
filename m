Received: from mail-m32107.qiye.163.com (mail-m32107.qiye.163.com [220.197.32.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737B3290DB
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 02:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787019260; cv=none; b=q8N3GsJTckxR4yAWPOXPXMucB1KbTDFMjhbF6G5TMJI3sMSgyihTTM77VX9tfNqYVS7B5BUlloF5GlZb71ACvOh839REQzfdNB1n3HAzQORu/03Ds+si2kqnCC16VwaY2F0UMQpjZwR5c5ojtK9iCoRNQONI3kRMgM6Zhifrnow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787019260; c=relaxed/simple;
	bh=DOqRjDS/NzCCo7LapyRqfyUlzgEYq07GmPjVBjOmsNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d19ssDhTtzFZYCeqzGzLSvP/X4deAms2OZefmq0p6kfFqn/k0JheAYpJ5wlL+6wJvknh5BcAoLcu3n8fwtAKBZOI5LO6ZbXM9Y6qu1RrMqjWuzeegticYs3sj4SxDI9Z6l5SRHRpDwCKoPOBCIwqiSZvfC/Q5PuJGvbcSLfXB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=YcVvipEN; arc=none smtp.client-ip=220.197.32.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="YcVvipEN"
Received: from localhost.localdomain (unknown [182.148.129.16])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a55eef39;
	Tue, 18 Aug 2026 10:08:58 +0800 (GMT+08:00)
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
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH v4 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Tue, 18 Aug 2026 10:08:43 +0800
Message-ID: <cover.1787017592.git.qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa012a1072509d8kunm71fba63862639
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0lMVktJGhhOTx9PQx8dSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVKTVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=YcVvipENjHThEsEqc/B9izL1nXTJ3GdoCUtFFm4bVCEl6TDplv4WgN3nrXishAz5eR7IhEgXPQ8I9RbZvz97F0SOuNo0AcqAqXhhj+u1/KGTczcR/IyPKMeHUERGF2spcXEaW1Ri1Vf0mQSn8L6WxI/Sa/BJo9eTEamHlR/3DDM=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=i40Mv0pyjB+M1875GgtW/kgQf1foXED3dy6CLsV/gB0=;
	h=date:mime-version:subject:message-id:from;

This series adds SoundWire SDCA support for Senary SN624x
multi-function codecs (jack, speaker amp, DMIC) on Intel ARL,
LNL, MTL, and PTL.

v3 was dropped due to a CI build break against current SDCA
helpers, so this is a full resend with those fixes folded in
(not an incremental on top of v3).

Changes since v3:
- Enable runtime PM from io_init() on first ATTACHED, matching
  the rt722 pattern, instead of enabling it from probe after
  register_component().
- Update sdca_asoc_pde_poll_actual_ps() / sdca_parse_function()
  call sites to the current prototypes (drop unused device and
  SoundWire slave arguments) so the driver builds on for-next.

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
 sound/soc/codecs/sn624x-sdca-sdw.c            | 1888 +++++++++++++++++
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
 17 files changed, 2932 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/sn624x-sdca-sdw.c
 create mode 100644 sound/soc/codecs/sn624x-sdca.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_amp.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_dmic.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

-- 
2.47.3

