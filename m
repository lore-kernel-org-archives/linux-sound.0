Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94684EB51
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651925; cv=none; b=poe+pLOH0N7b5lLRuw4WrMWubEf37Ixs8KeuxLZotXeC04ymY+vaztBLkeYjArgipcuKzUjtBHUPFvU+LH2e3Qf2yhEpOUVNOGulYW00L/VZj4PanoVuo+DTSfL2yO5ghbHEOygPnKT/6FLZecElM1Pe6cPux7VVcm9pgBh2Vsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651925; c=relaxed/simple;
	bh=eRcVce+TkIVL40K5TdgxpxLewsDlCeDX2RRTCQclh3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLmYe1vxSMnDb5gtKVx7Kd6w08z3piuzQm0P04T/S+JrMMJd3shSxi39hWnSrsUmPFN7BFc6cFaSwU/S8lB7fj9685LTxFfTx2HlHkMEAuBFlfrR5eoibB+DgP+hSNRz5xKLxVpWyykM7QBAtFoFh0BqIgDUC4ORmnnMq7bjpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgvY/Z6F; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgvY/Z6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712651924; x=1744187924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eRcVce+TkIVL40K5TdgxpxLewsDlCeDX2RRTCQclh3g=;
  b=IgvY/Z6F7jHBn0r7qQ0lJYPdaMCymECZ/TV1cHPuJqCTCiJQ84r9HFa7
   w603PK/LBfXy2Mj6M5SstxkN9MybGjRaqxQ2TIcNGx1gHBwI9ZWQaCGoF
   rtuBcVpWqwgeSH8p9FBBBcwnojMYVqXBDzjOK+9UVbAv/OCRjLHBfu/TD
   GUdLhzDXNuF4LRhSJlReLF9IfUSYJGK7R6ygAvNtlWQZC4UKfG5MIkOFG
   aq4fUyLPZwBAv4nbpZxuTuN7MTk0LFjkVvp5jXpc7eVo3Jx18qqFuAA22
   gHXxQR155tW4mvHeuu54A37LOKGZ50PDthk3Qem7ddzECmteWfS+SgLwr
   Q==;
X-CSE-ConnectionGUID: FbQiG7ArQea/8lW7SaSVQg==
X-CSE-MsgGUID: ypDtgQ1LSTS0DClOxHy3+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19108971"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19108971"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:36 -0700
X-CSE-ConnectionGUID: Qu/D1OGnQF+AOUk/lZKpAw==
X-CSE-MsgGUID: ydzuPjjhQxKd6edksgVR4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20189893"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com,
	perex@perex.cz
Subject: [PATCH 5/5] ASoC: SOF: Intel: hda-bus: Use PIO mode for Lunar Lake
Date: Tue,  9 Apr 2024 11:38:12 +0300
Message-ID: <20240409083812.14001-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
References: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is recommended that on Lunar Lake the PIO (immediate command response)
is used instead of CORB/RIRB for commands/verbs.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-bus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index fc63085d2d74..f78d6b998be0 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -72,7 +72,12 @@ void sof_hda_bus_init(struct snd_sof_dev *sdev, struct device *dev)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
+
 	snd_hdac_ext_bus_init(bus, dev, &bus_core_ops, sof_hda_ext_ops);
+
+	if (chip && chip->hw_ip_version == SOF_INTEL_ACE_2_0)
+		bus->use_pio_for_commands = true;
 #else
 	snd_hdac_ext_bus_init(bus, dev, NULL, NULL);
 #endif
-- 
2.44.0

