Received: from r3-51.sinamail.sina.com.cn (r3-51.sinamail.sina.com.cn [202.108.3.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802E31B10B
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642175; cv=none; b=CRPDpT7TdmaNzxOq6+wzprOBpp7Au2G2jU+nO+A2GgaBaPiUQpK6MPKZWPCI5IO5oG12zM+uyi4T3Mdcz0w2m1NCujRpqn6R2f/yU5uoZeF4a8peDsXNweCgoZRq7xsc/5UE4XuU+v2ccvpBXt3aAjtsUrDEz6EjzuSQ8/ygus4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642175; c=relaxed/simple;
	bh=eASR8qUNS9LJGV1WoHPO8eMe98Z7VIIKBbpdTGHgCcE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PKGyVkkadDfkPbB7Y/qjA6pOCX3OuOUznrIHSXyJKlYYiNosLVR6HSZr1DmrxPJOTb8n7AwilWksPBbNXet+HFSy9jjSduun4T3vuDtxsT/Avpk0hlsr+2JxIyMRqtAi15Bc3XgeHQ1ARsEKgLJxVn2YtIst2bdncw21J/NUmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A03ECEF00004B68; Wed, 13 May 2026 11:15:59 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 89185E27A674493A928FE70F9B4B1452
X-SMAIL-UIID: 89185E27A674493A928FE70F9B4B1452-20260513-111559
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	vkoul@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v14 0/6] Add es9356 focused SoundWire CODEC
Date: Wed, 13 May 2026 11:15:48 +0800
Message-Id: <20260513031554.5422-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This patch chain adds support for the ES9356 PC focused
SoundWire CODEC.

v14 -> v13:
	-Rebase onto latest linux-next for-next branch

v13 -> v12:
	-Fixed an issue where soc_sdw_es9356.c was missing

v12 -> v11:
	-Fix a helper function to `hw_params` and `hw_free`
	-Move pm_runtime initializations to probe
	-Add es9356 to wake_capable_list

v11 -> v10:
	-Add some comment for lock
	-Add a helper function to `hw_params` and `hw_free`

v10 -> v9:
	-Add some comment at codec driver
	-Fixed the jack_lock issue during suspend

v9 -> v8:
	-Fix some formatting issues in es9356.c
	-Removed regmap_write(SDW_SCP_SYSTEMCTRL) from the codec driver

v8 -> v7:
	-When the device status is UNATTACHED,
	 set regmap to cache-only and cancel any delay work already in the queue.

v7 -> v6:
	-Provide comments for some parameters
	-Rename `jack_detect_work` to `interrupt_handle_work`
	-Add a jack_lock when handling disable_irq in suspend
	-Adjust the handling procedure when a jack register
	 is incorrectly identified
	-Replace the custom SOC_SINGLE_Q78_TLV with SDCA_SINGLE_Q78_TLV

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

Zhang Yi (6):
  ASoC: sdw_utils: add soc_sdw_es9356
  ASoC: sdw_utils: add ES9356 in codec_info_list
  ASoC: es9356-sdca: Add ES9356 SDCA driver
  ASoC: Intel: soc-acpi: arl: Add es9356 support
  ASoC: Intel: sof_sdw: add es9356 support
  soundwire: intel_auxdevice: Add es9356 to wake_capable_list

 drivers/soundwire/intel_auxdevice.c           |    1 +
 include/sound/soc_sdw_utils.h                 |   14 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9356.c                     | 1153 +++++++++++++++++
 sound/soc/codecs/es9356.h                     |  208 +++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-arl-match.c   |   52 +
 sound/soc/sdw_utils/Makefile                  |    1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c          |  230 ++++
 sound/soc/sdw_utils/soc_sdw_utils.c           |   50 +
 11 files changed, 1719 insertions(+)
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

-- 
2.17.1

