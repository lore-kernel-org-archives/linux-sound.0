Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11311607AB
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838581; cv=none; b=ufX3K8y4rd3Ok+uhXaKD7X/lNbSm4Pi4bPtGWQqDlq090sQiM5CAEcBH4gWVIpIasjp4v0oZE6OYKhYXHxWCOL1C9j3xQS+gEPGWdeEFs2JSlOYp6uJwaeAOY4pEDnrfDS8FY2ryZJlTvYnn5UCPOyxJEOGVQGbGFDIBeaGI+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838581; c=relaxed/simple;
	bh=idMrl9zK4G+zC54METxzu7CjjMB3d2KiXfv/+/cCTQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7s+YVa8SVsoAnrm5L71irMa/C2NWV3gGE4ZBemrQ5wl17JIKLWsPD3Irsrqvkbl9cMdabn1pCoTwtscIkAdcKM9fI2/KkeL2fODdRM1wU+YaGyAsXxiA4gtBk4LffH1kRbBP4w+MG/NBc7sbRBQnv6mJMZ+Tk8CWcTgn6CjSMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOUPMKsn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOUPMKsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838579; x=1748374579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=idMrl9zK4G+zC54METxzu7CjjMB3d2KiXfv/+/cCTQQ=;
  b=MOUPMKsnwerKU61bSjEPpjCXlBuUTjXGoSqr9S75ii551BQAOzt5A7Dk
   lRj2JGTQm3XvR6Cz9xqIumQQpq18YgtFACp1u5hfEyJQ55e1ynAS+MJ9X
   IoJ8yVmWkd2l5MWUJOmG51GOhWcOQhuoxBn4x+NaKXKozGLYC4d/HDSZq
   00tWLmsfcmBOs9cghqgpZms19IL3NVNqSKIC8GAHhB3uv7HHBcidmx3iJ
   8QB/hioEVu4Upz9oHpQb34pcvf8NyJiQnnOEoradOncHcgCG9QW+d+aaj
   lFfgR6GVQSLZXTl/0KUaKn06p3A++m65mpeUIR3J7DM6jGcGyKKs1IiWD
   g==;
X-CSE-ConnectionGUID: rsgKF72WS5aYp2UksppfXQ==
X-CSE-MsgGUID: XNVABiNFTHKkSRPfAeKiWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339379"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339379"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:19 -0700
X-CSE-ConnectionGUID: dgaJvZ/bTNyiyEGIQkJ3Fg==
X-CSE-MsgGUID: IH8YwbcjRkCzIfjJqEg1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029781"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/18] ASoC: SOF: sof-audio: add sof_dai_get_tdm_slots function
Date: Mon, 27 May 2024 14:35:47 -0500
Message-ID: <20240527193552.165567-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

An new interface, sof_dai_get_tdm_slots(), is added for machine driver
to get tdm slot number from topology. The dai_get_param() callback
needs to support new parameter type SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS
by returning the tdm slot number of specific SSP port.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h       |  1 +
 sound/soc/sof/sof-audio.c | 10 ++++++++++
 sound/soc/sof/sof-audio.h |  5 +++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index ec6c30d54592..64fd5504cb2b 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -173,5 +173,6 @@ struct sof_dev_desc {
 
 int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd);
 int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd);
+int sof_dai_get_tdm_slots(struct snd_soc_pcm_runtime *rtd);
 
 #endif
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 2421a115747e..881eec38c2e2 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -1016,3 +1016,13 @@ int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
 	return sof_dai_get_param(rtd, SOF_DAI_PARAM_INTEL_SSP_BCLK);
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
+
+/*
+ * Helper to get SSP TDM slot number from a pcm_runtime.
+ * Return 0 if not exist.
+ */
+int sof_dai_get_tdm_slots(struct snd_soc_pcm_runtime *rtd)
+{
+	return sof_dai_get_param(rtd, SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS);
+}
+EXPORT_SYMBOL(sof_dai_get_tdm_slots);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index abb2a00c520d..49be02234fc3 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -44,8 +44,9 @@
 #define WIDGET_IS_AIF_OR_DAI(id) (WIDGET_IS_DAI(id) || WIDGET_IS_AIF(id))
 #define WIDGET_IS_COPIER(id) (WIDGET_IS_AIF_OR_DAI(id) || (id) == snd_soc_dapm_buffer)
 
-#define SOF_DAI_PARAM_INTEL_SSP_MCLK	0
-#define SOF_DAI_PARAM_INTEL_SSP_BCLK	1
+#define SOF_DAI_PARAM_INTEL_SSP_MCLK		0
+#define SOF_DAI_PARAM_INTEL_SSP_BCLK		1
+#define SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS	2
 
 enum sof_widget_op {
 	SOF_WIDGET_PREPARE,
-- 
2.43.0

