Received: from smtp134-89.sina.com.cn (smtp134-89.sina.com.cn [180.149.134.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903CD36605F
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 05:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770096297; cv=none; b=dsg53t8Yo0y8SFuXsNo8RlQMqzwGox2b9ZYxiGf/md2ntlvtk8pYZAdzEAl+rIdimXPc5vwySPW0s2cJyBSf4hoa9s/+jHkspFScZSj1UVjDfgox5FEjywYwZ/erkFNQGa5P2NSQUi31j3gVWXf1twkAsS+wdc1jJc/pexHq/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770096297; c=relaxed/simple;
	bh=jdIulspkWPjxNv1sbq7GhBi0MxMvm0tVU8q6xV2uHRs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=MIKiavKczt4Lvkb00TxAaL5ilPWK6KOxET7cWl+Vg2/KRZptf8xS4zj/z7jDjNALiCvuKLNDypoOdkrM4lFGT11uPBXejTFnMLN91XyFWImYB91V1EXQZ2ZXrTwUz/PQ2dF6WiBc0yYpsTLp/iUrFahPWOFvX6sDAAjYHxVc064=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.31) with ESMTP
	id 6981867B00003F3F; Tue, 3 Feb 2026 13:24:12 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 741807D858F747B7B83CC5274C14D1A7
X-SMAIL-UIID: 741807D858F747B7B83CC5274C14D1A7-20260203-132412
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 0/6] Add es9356 focused SoundWire CODEC
Date: Tue,  3 Feb 2026 13:24:00 +0800
Message-Id: <20260203052406.28562-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This patch chain adds support for the ES9356 PC focused
SoundWire CODEC.

Zhang Yi (6):
  ASoC: sdw_utils: Add ES9356 support functions
  ASoC: sdw_utils: add ES9356 in codec_info_list
  ASoC: sdw_utils: add soc_sdw_es9356
  ASoC: es9356-sdca: Add ES9356 SDCA driver
  ASoC: Intel: soc-acpi: arl: Add es9356 support
  ASoC: Intel: sof_sdw: add es9356 support

 include/sound/soc_sdw_utils.h                 |   15 +
 sound/soc/codecs/Kconfig                      |    6 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9356.c                     | 1483 +++++++++++++++++
 sound/soc/codecs/es9356.h                     |  218 +++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-arl-match.c   |   52 +
 sound/soc/sdw_utils/Makefile                  |    1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c          |  272 +++
 sound/soc/sdw_utils/soc_sdw_utils.c           |   50 +
 10 files changed, 2100 insertions(+)
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

-- 
2.17.1

