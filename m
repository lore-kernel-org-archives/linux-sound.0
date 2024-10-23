Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDDD1AB530
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729681547; cv=none; b=ZZkG6JMfliWFn05aQLt31esUbSNPFsjz14ysz0L0jMweTkAADrDFxqwMrKxBNHm/zFygGrND/922PgNYUBYiYK0VHCcTAVQhRQFg6z0BkI3btS5gdq0RlFUc9Z9CprWbIyEJzzWanFHCJfokXZQDpnQfFhPSjcPxahQ3KlqRjkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729681547; c=relaxed/simple;
	bh=D+Uz5bZpT1vwbILPqJ6L4hjLWuCjo3s9f0BFm1J3YvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BH45cCv7LUfHk3nn3hcSKnDDBDW/NKCtxOdurwUDmjgtG+fpTP4hIq0F7X9BFPrDc19nmlo1iMj2OX09d2XMoowMqbKoXdpuN2HkAzIG7Tp7ef69WSPpmmWxnrQYmyDeAJFsMk2ZWm7PqieWhX3/jA4I3G0C8k2lnUO/hVkTN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mO1b1CNJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mO1b1CNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729681545; x=1761217545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D+Uz5bZpT1vwbILPqJ6L4hjLWuCjo3s9f0BFm1J3YvM=;
  b=mO1b1CNJBRt9+ov7ib4SN77Q1xKQS+pwk5wyWPeUbciIyflOlQDDyaW5
   7KGDieBjFy4q43ceH5b0QoNYp/qC0y1wZu5QuXawtjcSASiwA98Ep8Jfc
   pxlyjz7nIj4PQD+mRayLT0l//2001K0dxptT9GMTOJ6T7x+faSOBbXSTY
   TTyU9jPq+2U9oJeLSN9w+2TVHZndC6oxdpFPunT7zDD79++D2FPGnqdKG
   6e1iYf/1FSuwMF1OqV4y9reZXwWu/xEEGhtsBnyxlZwnC0QKiEoImea7V
   FBhQMOgY0NN/Y1YVQd/nzyRM4iDHLkKqaMBVEqCIaiAXZNaUiVm7sTLAP
   w==;
X-CSE-ConnectionGUID: 8vlrLiZuR0mEYMiDcB6w0g==
X-CSE-MsgGUID: teffisDLSw2VPeWT/vY3nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40381189"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40381189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:05:45 -0700
X-CSE-ConnectionGUID: kBSydFYyShGVhT5/O56eNw==
X-CSE-MsgGUID: x8Szl0METwK6yv9Zrp9Xjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="79832678"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.23])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:05:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 1/2] ASoC: SOF: core: Add debug module parameters to set IPC and boot timeout
Date: Wed, 23 Oct 2024 14:06:09 +0300
Message-ID: <20241023110610.6141-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023110610.6141-1-peter.ujfalusi@linux.intel.com>
References: <20241023110610.6141-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two module parameters to override the IPC and boot timeout values if
the SOF stack is compiled with debug enabled to allow experimenting with
different timeout values without the need to recompile the kernel.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 83fe0401baf8..79bbbcca9c60 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -24,6 +24,17 @@ static int sof_core_debug =  IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE
 module_param_named(sof_debug, sof_core_debug, int, 0444);
 MODULE_PARM_DESC(sof_debug, "SOF core debug options (0x0 all off)");
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG)
+static unsigned int sof_ipc_timeout_ms;
+static unsigned int sof_boot_timeout_ms;
+module_param_named(ipc_timeout, sof_ipc_timeout_ms, uint, 0444);
+MODULE_PARM_DESC(ipc_timeout,
+		 "Set the IPC timeout value in ms (0 to use the platform default)");
+module_param_named(boot_timeout, sof_boot_timeout_ms, uint, 0444);
+MODULE_PARM_DESC(boot_timeout,
+		 "Set the DSP boot timeout value in ms (0 to use the platform default)");
+#endif
+
 /* SOF defaults if not provided by the platform in ms */
 #define TIMEOUT_DEFAULT_IPC_MS  500
 #define TIMEOUT_DEFAULT_BOOT_MS 2000
@@ -632,6 +643,15 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	else
 		sdev->boot_timeout = plat_data->desc->boot_timeout;
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG)
+	/* Override the timeout values with module parameter, if set */
+	if (sof_ipc_timeout_ms)
+		sdev->ipc_timeout = sof_ipc_timeout_ms;
+
+	if (sof_boot_timeout_ms)
+		sdev->boot_timeout = sof_boot_timeout_ms;
+#endif
+
 	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
 
 	/*
-- 
2.47.0

