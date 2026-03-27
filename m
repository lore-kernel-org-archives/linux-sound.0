Received: from r3-175.sinamail.sina.com.cn (r3-175.sinamail.sina.com.cn [202.108.3.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C003A6F0C
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605747; cv=none; b=pigGpC0EWhMykULkkLMHxLiwKZYziMO5l71fU4spCJFnTdpRUBIXWmbp3gZkRgtZ9RW11J3pMV7/Fo9TbbZExoOtPbqaxrjcTpAhRKB1oeU3g6rtEQSC3KFoFjKVchqkCvNoXBvkb9FIURwJ6CELH4hUNj+jw+foK3WXum19s5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605747; c=relaxed/simple;
	bh=YbnK08rZWklFiY7+rC+PHUmvS3etqJnKmwZ3LfFhTaA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=rqT6ryZcffngsZ9V3oRfpFQ+E0FbcOsyxRWqin2O2ctJYXVx3nsEpww8sdIzk/x2FDE0WxqB9iVSjRUojEKYygjGm5S29RSqw1FFzjq2veQNjdiTMOZ9F4M8o8VBQf2a/5fBi8tscqS87nwnDeZyYwlqb+6YrFsWxLmYoFJ03zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.38) with ESMTP
	id 69C6551D000030E9; Fri, 27 Mar 2026 17:59:58 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: E007750FC39347A2BF09C666DCB616DA
X-SMAIL-UIID: E007750FC39347A2BF09C666DCB616DA-20260327-175958
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 0/6] Add es9356 focused SoundWire CODEC
Date: Fri, 27 Mar 2026 17:59:48 +0800
Message-Id: <20260327095954.3465-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This patch chain adds support for the ES9356 PC focused
SoundWire CODEC.

v4 -> v3:
	-Updated some KControl names
	-add copyright in soc_sdw_es9356

v3 -> v2:
	-Removed unnecessary section in soc_sdw_es9356.c
	-Add `pm_runtime_put_noidle` to `es9356.c` to
	 reduce device incremented count
	-Updated some KControl names
	-Fix the error related to jack_report in the codec driver

v2 -> v1:
	-Adjusted mutexes in the ES9356 driver
	-Use macros to replace certain values
	-Adjusted some ordering issues in Kconfig.

v1 -> v0:
	-Modified snd_soc_dapm_add_routes in soc_sdw_es9356

Zhang Yi (6):
  ASoC: sdw_utils: Add ES9356 support functions
  ASoC: sdw_utils: add ES9356 in codec_info_list
  ASoC: sdw_utils: add soc_sdw_es9356
  ASoC: es9356-sdca: Add ES9356 SDCA driver
  ASoC: Intel: soc-acpi: arl: Add es9356 support
  ASoC: Intel: sof_sdw: add es9356 support

 include/sound/soc_sdw_utils.h                 |   14 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9356.c                     | 1485 +++++++++++++++++
 sound/soc/codecs/es9356.h                     |  227 +++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-arl-match.c   |   52 +
 sound/soc/sdw_utils/Makefile                  |    1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c          |  232 +++
 sound/soc/sdw_utils/soc_sdw_utils.c           |   49 +
 10 files changed, 2070 insertions(+)
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

-- 
2.17.1

