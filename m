Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2F7279DB4
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 05:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898846; cv=none; b=LyanuMh5i1sl1SCMbAHMYJnWZLmG179WrSLIPRjDoe5xhpWWCrKLqoGMBi1mrwuJX3xZTfJC9pjXq8vqIIt/s+GLg1VSfWUyys02cCqre2jeWZLCjnalfRUw3bVCkvHk8ul9el5zsb1WZaHXFxu/mPGcduoSlCLzRZh0889vpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898846; c=relaxed/simple;
	bh=wwHztt0ghbiV2DS08yWVudouRu5JqJTJ4R5wOTcQ9uo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=VTqiluI8mFUsN0Uu2cqDvmtaHKG7Ui4xtYzEtHwBM8oo64OfVTfPPZuX0enx2SyFaLfRUNppWTxbEG5msQ/F3KktvhSb4bPWQBkbbKxYHWTCEVy6g+zpu45YyQOJv9o7sWyUbgci2ZB3y+Br1l+yv62+xVtry7AwMaAmDQLe904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.37) with ESMTP
	id 69BB8C3100002EA9; Thu, 19 Mar 2026 13:40:02 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 65E50457B39545DB89F53F2B45339A16
X-SMAIL-UIID: 65E50457B39545DB89F53F2B45339A16-20260319-134002
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v3 0/6] Add es9356 focused SoundWire CODEC
Date: Thu, 19 Mar 2026 13:39:53 +0800
Message-Id: <20260319053959.9151-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This patch chain adds support for the ES9356 PC focused
SoundWire CODEC.

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
 sound/soc/codecs/Kconfig                      |    6 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9356.c                     | 1485 +++++++++++++++++
 sound/soc/codecs/es9356.h                     |  229 +++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-arl-match.c   |   52 +
 sound/soc/sdw_utils/Makefile                  |    1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c          |  231 +++
 sound/soc/sdw_utils/soc_sdw_utils.c           |   49 +
 10 files changed, 2070 insertions(+)
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

-- 
2.17.1

