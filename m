Received: from mail-m32121.qiye.163.com (mail-m32121.qiye.163.com [220.197.32.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F34F35F60E
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 03:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787195085; cv=none; b=FWtN9bL86BU7O3dalUuw4V932HqU2fgdhmOuy2Ra+sQMV7Mbdmg6OBukaa9VSgf91Y6xLEko0dmKcux8Yao1t6vpTaFAwbxTXrLA3nN/6ipEbR2LDGkb88uPq98aqDYwkNYGN66nfNWS2xqtKJeAkPa10CqoRPfNA88sS7g+3Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787195085; c=relaxed/simple;
	bh=5Y8M6y7Ok2zF/iT0H4y5qiymZOeKEjN4jWECadbWvos=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=MjDuGsKny6FJJYfFa83LKfoOJZYynjRrJdMTbi2sx7Egc/1/Rc/YlUYRCuJJJ/ZKIgUJeIaMs+EGGpw2ORH2Zi+yjSniTtr3rT79+cxCgNXnISC+ZBYEaDx42iR8bP/KIrJQ+hUPjDPAiKWMngpIpdgCbQGagrj4BX43drJzIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=KatPXfpk; arc=none smtp.client-ip=220.197.32.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="KatPXfpk"
Received: from Wangqianghua (unknown [182.148.168.85])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4aa42d4bd;
	Thu, 20 Aug 2026 10:49:12 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: <linux-sound@vger.kernel.org>
Cc: "'Mark Brown'" <broonie@kernel.org>,
	"'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	"'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Liam Girdwood'" <liam.r.girdwood@linux.intel.com>,
	"'Peter Ujfalusi'" <peter.ujfalusi@linux.intel.com>,
	"'Kai Vehmanen'" <kai.vehmanen@linux.intel.com>,
	"'Cezary Rojewski'" <cezary.rojewski@intel.com>,
	"'Charles Keepax'" <ckeepax@opensource.cirrus.com>,
	"'bo liu'" <bo.liu@senarytech.com>
References: <cover.1787017592.git.qianghua.wang@senarytech.com>
In-Reply-To: <cover.1787017592.git.qianghua.wang@senarytech.com>
Subject:  [PATCH v4 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Thu, 20 Aug 2026 10:49:08 +0800
Message-ID: <015101dd304e$794525a0$6bcf70e0$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad0wTm5emDBZy1NcT/eX2T/wkukfOQ==
Content-Language: zh-cn
X-HM-Tid: 0aa01d1295d709d8kunmdebbd3611f0251
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGE5KVkxCH0lMHUgfTxpDGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpNQ1VDTllXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=KatPXfpk3h7qeqo9HxXP6xCoAo29OrdAPiZVVN/njIKbRo1iQ3OEC5ZzKcuc2E6/IsyOWNf8DmMGed0PnB1dlSQQi8NxUw88xplol5E/4/V2WXbgIIaEW69/aOMfP7yP+pEo76APUMfztBZwzU9RFZxLZfFzw1B+d32X1ol37mA=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=XjzduulMvYvajFeka0NKPlH381IRHAdTQi883uijGVY=;
	h=date:mime-version:subject:message-id:from;

Hi Mark, Charles,
	Just a gentle ping on the SN624x v4 series. v3 was dropped due to
the CI build break; v4 is a full resend with those fixes folded into patch
1/3 (runtime PM enabled on first ATTACHED, and SDCA helper call sites
updated to the current prototypes).
Please let me know if anything else is needed, or if I should
rebase onto a newer tip.

Thanks,
Qianghua Wang
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>
[PATCH v4 0/3] ASoC: add Senary SN624x SoundWire SDCA support

This series adds SoundWire SDCA support for Senary SN624x multi-function
codecs (jack, speaker amp, DMIC) on Intel ARL, LNL, MTL, and PTL.

v3 was dropped due to a CI build break against current SDCA helpers, so this
is a full resend with those fixes folded in (not an incremental on top of
v3).

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

Validated on LG Wildcat Lake / PTL with part_id 0x6247 (MODALIAS
sdw:m0496p6247v03c01).

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
 17 files changed, 2932 insertions(+), 1 deletion(-)  create mode 100644
sound/soc/codecs/sn624x-sdca-sdw.c
 create mode 100644 sound/soc/codecs/sn624x-sdca.h  create mode 100644
sound/soc/sdw_utils/soc_sdw_senary_amp.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_dmic.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

--
2.47.3



