Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04E271A71
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 02:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775700822; cv=none; b=h7td5JN+1s5kFqYLPdKkFcJuRoBQYVTD0uQ2we9jiyy6hM/CL+4CJYs4a2UJUBU3ib3705oZ6CYK1GKyqYw9dm33t13dYwx2RFsck/t9BCdI8HeWJgvuRSIg7YIq8plfRL+drCW+aH3pI0uAK6yCYa7A4b58oYL3WIYx4Etdb9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775700822; c=relaxed/simple;
	bh=LK2KDHSWs61jENQ77D+BmtY7wMHOeISC72te6TMmGRw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=gFevruiYOd6IgX6ARK6u40e8DSaCcBR5SVz11xlcyQ9ePbDwADWPA73Mmsf63+K0J44TSRWZ3vH1J327+bemFLh6EbTN1dRTEQMJa0PJiphxdLmxTWaacxq9Lq9BigJZrQj6WbTUkZvDUc8ouusha7340Iktg37YnwYPvNKW8CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.37) with ESMTP
	id 69D70B2A00005E49; Thu, 9 Apr 2026 10:12:59 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 5F8325934CD941BD89CEACA00D270C2F
X-SMAIL-UIID: 5F8325934CD941BD89CEACA00D270C2F-20260409-101259
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v6 0/5] Add es9356 focused SoundWire CODEC
Date: Thu,  9 Apr 2026 10:12:50 +0800
Message-Id: <20260409021255.1006-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This patch chain adds support for the ES9356 PC focused
SoundWire CODEC.

v6 -> v5:
	-Handling default values in `button_detect` and `jack_detect`
	-Add the member `disable_irq` so that interrupts are
	 no longer processed after suspend.
	-Move the PDE processing to `hw_params` and `hw_free`
	-Separate JACK_OUT and JACK_IN in hw_params
	-Simplify reading and writing to SDW_SCP_SDCA_INT1 in the callback
	-Adjust the scope of `regcache_sync` in the resume

v5 -> v4:
	-Merge patch1 and patch3
	-Add vendor_id in codec_info
	-Use q78_get and q78_set to create Kcontrol
	-Set mbq_size and use regmap_mbq
	-An additional helper function to implement DAPM

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

Zhang Yi (5):
  ASoC: sdw_utils: add soc_sdw_es9356
  ASoC: sdw_utils: add ES9356 in codec_info_list
  ASoC: es9356-sdca: Add ES9356 SDCA driver
  ASoC: Intel: soc-acpi: arl: Add es9356 support
  ASoC: Intel: sof_sdw: add es9356 support

 include/sound/soc_sdw_utils.h                 |   14 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9356.c                     | 1167 +++++++++++++++++
 sound/soc/codecs/es9356.h                     |  208 +++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-arl-match.c   |   52 +
 sound/soc/sdw_utils/Makefile                  |    1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c          |  230 ++++
 sound/soc/sdw_utils/soc_sdw_utils.c           |   50 +
 10 files changed, 1732 insertions(+)
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

-- 
2.17.1

