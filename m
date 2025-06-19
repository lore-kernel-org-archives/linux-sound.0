Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A9221F05
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328749; cv=none; b=a12EvDtK8D6JbYm6rYcp19ImBA4YeJ72lgi0xd+Blq99YU7pvptwsGzGafaKgpRtU3JBNeXc4sYJ3dX3nIIU6mKrinvK9vquHwiAerEZYQ0RlHH38RfAyYtwGR0K/K1bmywyna//b5xAKNy6wBKEeRAosD7+YT3lKGI0nOFAu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328749; c=relaxed/simple;
	bh=ODWDIq6NN/HoZeJ142bIQ+g2YlivTrmWkQXLRT1/AtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=To+kx8PwTcXyMLsdfmd6mqfX4ksNxpe7u9Z+l5j3z4YXKaQ5SakIqSn9fnTEVYlRCRVTiTE+Nu8JsVSqOwLKCDi9Mt4vyr6oUF1/z/GvR9tj+NnbliuTF5wK3RdfdqUNS3p6U8ArJZip6l+pmWszoMxtrn2SF2eR83ST3t4DSiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HspDvLIy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HspDvLIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750328747; x=1781864747;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ODWDIq6NN/HoZeJ142bIQ+g2YlivTrmWkQXLRT1/AtY=;
  b=HspDvLIyWPRyRE2ZgNLRDi0PSsaY6UOrvwRfL39FAhhED2TQDw7+VNLC
   a6O/zHoua4Fzq/s7xy8OnUum88RdSLmwTLEtyDv0KA/4dcMutQ9H1l/e/
   pSH/GCiLYC2DRn55anrk5qCH7sHQMEfGLadpB2OK5QLZZHiO02Z6yIgy5
   gBM1jM8dbvhlzhLWtoSxde4ADWPzcbK6jAIGeu20PIROWjUuLP2PTD0m1
   ffWPmHPwMowj+6U50/86zi9YUFychmmcstF2ocIvwJaXOcg3BsLZqzwS5
   v8QjFSJ9AJbF9AZAQtiy6thMD0bj8vlju8PebQg+c1f/OwetrKA71Vm4O
   Q==;
X-CSE-ConnectionGUID: 52pxvIpXRQWF0DO3imKfvw==
X-CSE-MsgGUID: /VTbHjT9RXONwm+dSxbL0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="62848475"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="62848475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:25:46 -0700
X-CSE-ConnectionGUID: yjj488BnSLiC8foOAtdLQQ==
X-CSE-MsgGUID: fXHB2XLpSoSFLvk06puXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150706812"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:25:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda: Do not probe Soundwire in nocodec mode
Date: Thu, 19 Jun 2025 13:25:48 +0300
Message-ID: <20250619102548.11928-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Soundwire is not needed for nocodec mode, skip probing it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index bdfe388da198..5347c433ac8e 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -629,6 +629,11 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
 		goto skip_soundwire;
 
+	/* Skip SoundWire in nocodec mode */
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		goto skip_soundwire;
+
 	/* scan SoundWire capabilities exposed by DSDT */
 	ret = hda_sdw_acpi_scan(sdev);
 	if (ret < 0) {
-- 
2.49.0

