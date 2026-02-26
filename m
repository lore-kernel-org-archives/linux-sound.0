Received: from r3-72.sinamail.sina.com.cn (r3-72.sinamail.sina.com.cn [202.108.3.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C977F38A71B
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091383; cv=none; b=CjsGvJjcfPvD0G75d4s621AK2GZ+nNjwWySiQh1/dngDAX6kl6eN+KcJCj7aoxYo/Zlalm/BaYcdX2gytgRkXQFNZvpigI1pohiqgDlDfON2a4gAQKWuuy7KCmDU7Or5SS276ajnkXEBvpjil+IiVg9XbUr4aT5p9y+79oSRR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091383; c=relaxed/simple;
	bh=PDZuGe7hlBY07Gc5MmzS5X6WtzG9oYUspcSKk/qoMQg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=F1AG/b7vZj87ZfVfX1qig+OKzSLOz+G5IAI3g8VZ8ijqXQYRToFcGT82QO5a3WnYeZbxXchpVIm4A8j2+cINysfe9QxSlXzL5EqGiURRfG7IfLP5psI1eAJyobeowNyySgwSO73Bo20EthTl+vQhqjsVuXjTKpy6PeXCfe6CYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 699FF7CB00003FE6; Thu, 26 Feb 2026 15:35:40 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 5B731130AB8D48EE8CF580737B1F1DCC
X-SMAIL-UIID: 5B731130AB8D48EE8CF580737B1F1DCC-20260226-153540
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 0/6] Add es9356 focused SoundWire CODEC
Date: Thu, 26 Feb 2026 15:35:28 +0800
Message-Id: <20260226073534.3347-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This patch chain adds support for the ES9356 PC focused
SoundWire CODEC.

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

 include/sound/soc_sdw_utils.h                 |   15 +
 sound/soc/codecs/Kconfig                      |    6 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9356.c                     | 1487 +++++++++++++++++
 sound/soc/codecs/es9356.h                     |  228 +++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-arl-match.c   |   52 +
 sound/soc/sdw_utils/Makefile                  |    1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c          |  275 +++
 sound/soc/sdw_utils/soc_sdw_utils.c           |   50 +
 10 files changed, 2117 insertions(+)
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

-- 
2.17.1

