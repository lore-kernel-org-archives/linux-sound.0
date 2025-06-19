Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83DA223302
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328817; cv=none; b=M0iVlXILDX48dgfog8E5O/tpLLHq0TOBt3e17rtPQBDOWwHzNXDnRHrtXqxCMX980+f7+FNbvGpufPvRxXuR11jDRqpIECWZD4EaXVfaYiJGarRRtaIQh5qVFtSPZLGT9GnBRDGPGDQ5cYx1K00wGdzfXKco0vocdPb8uVxo0XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328817; c=relaxed/simple;
	bh=mo0pLRPXB4r6nnQuWCt8vP3GBBVPtEp8DbhjFmQvFZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJagB56k0VIU9Lzzy7cPIMyvK1ete/J94sDbT3EQ9iBsxEQ33OeWOEbCfROjYjoVaHK2RZ+vIjXHUQ7UTW55IvVONQRVc5DSSpKbiJ/UhnEXiutCQcgNK4IwPcMJJeij5/8gbQ4zfKVAKlzD7ty1t0PvX5QJS2Rk8vEdzZmz3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkBuOCHo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkBuOCHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750328816; x=1781864816;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mo0pLRPXB4r6nnQuWCt8vP3GBBVPtEp8DbhjFmQvFZs=;
  b=mkBuOCHoxpnA6XODXFmuLvbJDYE3/aNM0TZgEY8nVAK7gnOLasx2ebIy
   uacNXPWoj5Kn0SWIbTLKMJT6juY08vmj1RmVAN56TEgqKOLqBY2vrqULO
   CKKrso/JKlVaNf5eP5lMbBCphZxzpZHT+tE4h1rCCheiTrXO8M5+s9zsE
   h4+3NvitIkJDyhq4mGQyxfluKHfTCHz2RjrBvuhvyVYxJsmXksqFC0vKD
   w/s/fHEpuWdV4gktAg8QHTmmtJJ9eV21PIy2DB1A0LBMEuqArVXhYM27/
   H5ePbGS3ShgyJYe9TahIEb3J5hMOpJWZG3h+XMMCTKVHgLK21hmpwCOjr
   Q==;
X-CSE-ConnectionGUID: BMqL0RDmQ7GXjmwldZS1Qg==
X-CSE-MsgGUID: uVODBLVjRzG+rrFZAKXLlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64008418"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64008418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:26:55 -0700
X-CSE-ConnectionGUID: /DXSvepSRyyXpALmN2ZY8g==
X-CSE-MsgGUID: n7LGwhH7S1u/uJ7oVyu0Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155174270"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:26:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: ipc4-pcm: Look for best matching hw_config for SSP
Date: Thu, 19 Jun 2025 13:26:57 +0300
Message-ID: <20250619102657.12109-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of just looking for a hw_config with matching rate only it sounds
better to try to find the best matching configuration.

If we have multiple hw_configurations with the same rate, but each with
different format for example then we have been picking the first config
with the matching rate, which can be a problem and it wil depend on how
the configs are ordered.

Instead we should be trying to find the best match out of the configs
1. rate + format + channels are matching
2. rate + format are matching
3. rate matching

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 61 ++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 8eee3e1aadf9..a5b365ab1945 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -557,12 +557,15 @@ static int sof_ipc4_pcm_hw_free(struct snd_soc_component *component,
 	return sof_ipc4_trigger_pipelines(component, substream, SOF_IPC4_PIPE_RESET, 0);
 }
 
-static void ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char *link_name,
-						 struct snd_pcm_hw_params *params)
+static int ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev,
+						const char *link_name,
+						struct snd_pcm_hw_params *params)
 {
 	struct snd_sof_dai_link *slink;
 	struct snd_sof_dai *dai;
 	bool dai_link_found = false;
+	int current_config = -1;
+	bool partial_match;
 	int i;
 
 	list_for_each_entry(slink, &sdev->dai_link_list, list) {
@@ -573,19 +576,50 @@ static void ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const
 	}
 
 	if (!dai_link_found)
-		return;
+		return 0;
 
+	/*
+	 * Find the first best matching hardware config:
+	 * rate + format + channels are matching
+	 * rate + channel are matching
+	 *
+	 * The copier cannot do rate and/or channel conversion.
+	 */
 	for (i = 0; i < slink->num_hw_configs; i++) {
 		struct snd_soc_tplg_hw_config *hw_config = &slink->hw_configs[i];
 
-		if (params_rate(params) == le32_to_cpu(hw_config->fsync_rate)) {
-			/* set current config for all DAI's with matching name */
-			list_for_each_entry(dai, &sdev->dai_list, list)
-				if (!strcmp(slink->link->name, dai->name))
-					dai->current_config = le32_to_cpu(hw_config->id);
+		if (params_rate(params) == le32_to_cpu(hw_config->fsync_rate) &&
+		    params_width(params) == le32_to_cpu(hw_config->tdm_slot_width) &&
+		    params_channels(params) == le32_to_cpu(hw_config->tdm_slots)) {
+			current_config = le32_to_cpu(hw_config->id);
+			partial_match = false;
+			/* best match found */
 			break;
+		} else if (current_config < 0 &&
+			   params_rate(params) == le32_to_cpu(hw_config->fsync_rate) &&
+			   params_channels(params) == le32_to_cpu(hw_config->tdm_slots)) {
+			current_config = le32_to_cpu(hw_config->id);
+			partial_match = true;
+			/* keep looking for better match */
 		}
 	}
+
+	if (current_config < 0) {
+		dev_err(sdev->dev,
+			"%s: No suitable hw_config found for %s (num_hw_configs: %d)\n",
+			__func__, slink->link->name, slink->num_hw_configs);
+		return -EINVAL;
+	}
+
+	dev_dbg(sdev->dev,
+		"hw_config for %s: %d (num_hw_configs: %d) with %s match\n",
+		slink->link->name, current_config, slink->num_hw_configs,
+		partial_match ? "partial" : "full");
+	list_for_each_entry(dai, &sdev->dai_list, list)
+		if (!strcmp(slink->link->name, dai->name))
+			dai->current_config = current_config;
+
+	return 0;
 }
 
 /*
@@ -728,13 +762,10 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		break;
 	}
 
-	switch (ipc4_copier->dai_type) {
-	case SOF_DAI_INTEL_SSP:
-		ipc4_ssp_dai_config_pcm_params_match(sdev, (char *)rtd->dai_link->name, params);
-		break;
-	default:
-		break;
-	}
+	if (ipc4_copier->dai_type == SOF_DAI_INTEL_SSP)
+		return ipc4_ssp_dai_config_pcm_params_match(sdev,
+							    (char *)rtd->dai_link->name,
+							    params);
 
 	return 0;
 }
-- 
2.49.0

