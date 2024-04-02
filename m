Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A709A12E1E4
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071121; cv=none; b=Nmivh8d4UGUSAyiXzkUc3ZbPZkboaJowd2GiNWpnftJjnYcG99yUe9tYbdHFJpmneLzIpWfWnprtsNxqBjFDl0SILRxpydnrKAKrwZZ4oELAc0e43IDTmvDeu4aLEOiwVsgZd6vgqX3yqTGTJVrxjBgB2wwZsSAAIICwjywOGpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071121; c=relaxed/simple;
	bh=DellMu4C0z2SqkW/GwLBIPF8taj4i2Q0cZ8ESqFaIqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OWjRJvnocAuNYdNjxH5oyODPEoBzmrWi2HdBUEBVl3DqqtvTBNQjOq41b+rz+0J4q+BxIo5OjZiXzBUsZfwBRTG09BBQ9I54COMB2+n2zOXlMKMEsNRQqYFAlBI3eeWo6X0S9ekpVwzBKOJTy+GOmI7StKTQrYvlOUoEiGsoRV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXaDE5fA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXaDE5fA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071120; x=1743607120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DellMu4C0z2SqkW/GwLBIPF8taj4i2Q0cZ8ESqFaIqo=;
  b=DXaDE5fAtuYST2tRrY06hyyz2S3RWymYiC4+/ZPCPeUlYueZ1RASsiKi
   IKXSWy6i4GpJLQGVSBVrLJt4cBsRQUIeDozckpkxD0nfNc88J40HtQe8X
   lXXKbdFKdGHLgbQQOMsAsyhjlzVDruMifRhH+qPdp32Jd5cumdt9/uMUa
   a1EqSv8NZiG6tDh0LNj4SEqfVOI405XOP3OKo4mf50kPa+/7qoYyIMse+
   xD+3k99fdO5mbHcEwOB3geRoAMqar0O0QZvhHQTFGRaH/k8jmEzIyteNn
   1/gl9c4kqY4zaVddJlOn2JycZP1z+fBdSdD3j7jPHgpnlk3cEWLaVzfiL
   Q==;
X-CSE-ConnectionGUID: EmYsOFTBSk+Z+ClOfvtIlA==
X-CSE-MsgGUID: P5loq9U4RueftFlKi28taw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729939"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29729939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:39 -0700
X-CSE-ConnectionGUID: 9+0bWIcCT1SyLGaOAeBmFg==
X-CSE-MsgGUID: 16er1bKtTPuzsFoN/NDyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796494"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/17] ASoC: SOF: make dma_config_tlv be an array
Date: Tue,  2 Apr 2024 10:18:15 -0500
Message-Id: <20240402151828.175002-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Each stream needs a dma_config_tlv. We will handle multi dma_config_tlv
in the follow up commits.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c |  2 +-
 sound/soc/sof/ipc4-topology.c | 25 ++++++++++++-------------
 sound/soc/sof/ipc4-topology.h |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 6a39ca632f55..01c544b7e046 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -392,7 +392,7 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	/* configure TLV */
 	ipc4_copier = widget_to_copier(w);
 
-	dma_config_tlv = &ipc4_copier->dma_config_tlv;
+	dma_config_tlv = &ipc4_copier->dma_config_tlv[0];
 	dma_config_tlv->type = SOF_IPC4_GTW_DMA_CONFIG_ID;
 	/* dma_config_priv_size is zero */
 	dma_config_tlv->length = sizeof(dma_config_tlv->dma_config);
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 427f186ddc11..1870488b3cf6 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1486,6 +1486,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	u32 deep_buffer_dma_ms = 0;
 	int output_fmt_index;
 	bool single_output_format;
+	int i;
 
 	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
 
@@ -1711,7 +1712,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			u32 ch_map;
 			u32 step;
 			u32 mask;
-			int i;
 
 			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
 
@@ -1821,19 +1821,18 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	gtw_cfg_config_length = copier_data->gtw_cfg.config_length * 4;
 	ipc_size = sizeof(*copier_data) + gtw_cfg_config_length;
 
-	if (ipc4_copier->dma_config_tlv.type == SOF_IPC4_GTW_DMA_CONFIG_ID &&
-	    ipc4_copier->dma_config_tlv.length) {
-		dma_config_tlv_size = sizeof(ipc4_copier->dma_config_tlv) +
-			ipc4_copier->dma_config_tlv.dma_config.dma_priv_config_size;
-
-		/* paranoia check on TLV size/length */
-		if (dma_config_tlv_size != ipc4_copier->dma_config_tlv.length +
-		    sizeof(uint32_t) * 2) {
-			dev_err(sdev->dev, "Invalid configuration, TLV size %d length %d\n",
-				dma_config_tlv_size, ipc4_copier->dma_config_tlv.length);
-			return -EINVAL;
-		}
+	dma_config_tlv_size = 0;
+	for (i = 0; i < SOF_IPC4_DMA_DEVICE_MAX_COUNT; i++) {
+		if (ipc4_copier->dma_config_tlv[i].type != SOF_IPC4_GTW_DMA_CONFIG_ID)
+			continue;
+		dma_config_tlv_size += ipc4_copier->dma_config_tlv[i].length;
+		dma_config_tlv_size +=
+			ipc4_copier->dma_config_tlv[i].dma_config.dma_priv_config_size;
+		dma_config_tlv_size += (sizeof(ipc4_copier->dma_config_tlv[i]) -
+			sizeof(ipc4_copier->dma_config_tlv[i].dma_config));
+	}
 
+	if (dma_config_tlv_size) {
 		ipc_size += dma_config_tlv_size;
 
 		/* we also need to increase the size at the gtw level */
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index dce174a190dd..aa5122c3721d 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -313,7 +313,7 @@ struct sof_ipc4_copier {
 	struct sof_ipc4_gtw_attributes *gtw_attr;
 	u32 dai_type;
 	int dai_index;
-	struct sof_ipc4_dma_config_tlv dma_config_tlv;
+	struct sof_ipc4_dma_config_tlv dma_config_tlv[SOF_IPC4_DMA_DEVICE_MAX_COUNT];
 };
 
 /**
-- 
2.40.1

