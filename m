Received: from mail-m3295.qiye.163.com (mail-m3295.qiye.163.com [220.197.32.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79C83783C3
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 03:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232595; cv=none; b=nQsyNRXDj0sL4WgZJBJXZdP+8o1csC148IGLp3NCkyjCjrAcF6HA7isITMKxAFAZVN37PgjihRRqIZwnGHWxVUJXnir6llJoElcf313RLTgo6fYOneej9h4D3VROMWMks6IeqZsUjSTJ5CYEC+a6aX8bC3bnbbpnheNNvQvlA/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232595; c=relaxed/simple;
	bh=878PHLdnXTmkklBXWl5cRPqZLy7zXUth3z6Z6eyJNXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gKtREEx2O7K+9M5VlLhVxbmZxL/mBm/tCrpDRr2hjkLQqGxR4qbBHGA/X2LIYaYQuSMVFsBMn6Jbm9wn4RcBgFJJuSKYk04kcsHTNBo+5CuZxAhzWq20rbkx5Wdqi631a/nBAIW2rVd8MwE+0o/++fSSxtqUyAv4kA5+qfsTEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=B53d+sNl; arc=none smtp.client-ip=220.197.32.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="B53d+sNl"
Received: from test-VJFE6CF11X-XXXXXX (unknown [112.193.82.77])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c0aaaca4;
	Tue, 1 Sep 2026 11:01:06 +0800 (GMT+08:00)
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
Subject: [PATCH v5 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Tue,  1 Sep 2026 11:00:46 +0800
Message-ID: <cover.1788230065.git.qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa05ae9c92509d8kunm596bfc8a4b2096
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSk5PVkseH01KSksYSUoaGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVSkJIVUNJVUxMWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=B53d+sNlkd9c5zYSEXD/MJC1L+tsSXfpZ4CWSl/gyIofDW1BtmTr9ZGGgPjEFgNIW1qhJv5VzpMULNHblqJ+Q5xuQUzDtrrGY9BlqTePV1NkcQjuQzdV4LC9D6WjCbvsezes4pCPbcE/rrM/rto9x3IidpsX0mkdY3j6SwZ3msI=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=v4RfcHx8SiLk5aJViIDHfP0pv7PN5E/8xW+hCgjH6B4=;
	h=date:mime-version:subject:message-id:from;

This series adds SoundWire SDCA support for Senary SN624x
multi-function codecs (jack, speaker amp, DMIC) on Intel ARL,
LNL, MTL, and PTL.

Based on current sound.git tip (249bfb5d8897 — Merge branch 'for-next').

Changes since v4:
- Rebase onto current code so the series applies cleanly.
  v4 failed to apply mainly against updated Intel soc-acpi
  match tables (PTL/MTL and related function-topology defaults).
- No intentional functional changes versus v4; content is the
  same three patches refreshed for the new context.

Validated previously on LG / Positivo Wildcat Lake (PTL) with
part_id 0x6244 (MODALIAS sdw:m0496p6244v03c01).

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
2.53.0

