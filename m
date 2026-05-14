Received: from smtp153-177.sina.com.cn (smtp153-177.sina.com.cn [61.135.153.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF763A9851
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745286; cv=none; b=JqQyu7irU4G/vDI1pmjXUHB1NxnWZBt+JL3tAql1CuDx3EIsZAWpns8/c6ZgoXaSqPhwDbyHzFm4GyFS4tSU4DtOnBWJpj6JNFI1cv3Q274xIoLeJVjA1arXmPwoNHwMqmT8QwwJ83joziR3umou542mVXdd4KF1/q6cNOcsyMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745286; c=relaxed/simple;
	bh=mJB/klxDJUiH4rzVegZNwHJUKpzRPW8kgoioPB0U46c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=mde2jUmxIJGYczTpXGEdShSSMZlc2e7movsh31BqEyAxNkQ4egxjRmhiiarw2ySBsDibt/iaeVkFRdmdXt0jHPJULGDSw/I0LfHP+kqBt5s593X2toZU2TLlHOP3N2ytWYc+y+alffjqSO2SPnyVL8ElPO3Po5T4J/ufBcKokVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A057F2A0000134F; Thu, 14 May 2026 15:52:10 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 21D17F16641849B98A72E47422454FF2
X-SMAIL-UIID: 21D17F16641849B98A72E47422454FF2-20260514-155210
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
Subject: [PATCH v15 0/6] Add es9356 focused SoundWire CODEC
Date: Thu, 14 May 2026 15:52:00 +0800
Message-Id: <20260514075206.3483-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

This patch chain adds support for the ES9356 PC focused
SoundWire CODEC.

v15 -> v14:
	-Change `es9356_sdw_remove` from `int(*)` to `void(*)`

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
 sound/soc/codecs/es9356.c                     | 1151 +++++++++++++++++
 sound/soc/codecs/es9356.h                     |  208 +++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-arl-match.c   |   52 +
 sound/soc/sdw_utils/Makefile                  |    1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c          |  230 ++++
 sound/soc/sdw_utils/soc_sdw_utils.c           |   50 +
 11 files changed, 1717 insertions(+)
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

-- 
2.17.1

