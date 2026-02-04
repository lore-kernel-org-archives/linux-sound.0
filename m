Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5065F36AB53
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193083; cv=none; b=fNwV6gbh9UljBMHP03+ZWlS2XYFClSKOSlkQ006qKMj3U7RHmEHw6+JzLueTFPnEyMBMKwouYV562SHb8Xbmi4NMSyq/N8PFnH2ZndFhLG5R1Gqt1+w7tm+PqnUUwmNCIv1zbw4wirD4gbJMa8N/+x/ZcVFYjnGKI9SvrC3aP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193083; c=relaxed/simple;
	bh=zRbOdVqtbZdgg22SPFJs7J6o17SNmBoIV8MJqvtz/lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZX8x2I939wjgDRYAOAzPUx1f2ENVD6y4G1FNGyQFUnuxfxMBzhVeICGlyEvRKaDvbsErEj1agvYXE8a5A93K1dLpQ33FIfmPNME4gCUGUCk0dGeQsInmAJdzgira8g8H8C5sTq2LFd2QXpzcBeA6+biXXWpVMoG8eQF3G/zl67o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFgZXq6c; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFgZXq6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193084; x=1801729084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zRbOdVqtbZdgg22SPFJs7J6o17SNmBoIV8MJqvtz/lA=;
  b=JFgZXq6cifAQOh45W1zcSRULWlickm6VRzEe6BfUIQ+2GCquQ2O1ZY4U
   AdQczECUTOyU1DxWSkas8hyzLriXNHd2JK9whswFkr9uSYbnRG2BgqrZX
   ZAFaRCDXpmO/T31Or56OX4axZZgb/eJNAMLYW9KW03QVKXrwWE2J6BOT9
   FqBTsttjFvHYtwoOcSBjjQGupmYKxFN/1f0P0NmVZ8AK2gV3CUwk0Rw8R
   Li3udNpJH8ppak/2FLugBoAtfdcZhBbTcMFOWo429H/pPpv3zCT/v5n8h
   Utbx2C7uVq8ztXOnN45dSwVEiS0sorurHPqv7t+xn6QkEx3edpAEmqqQi
   g==;
X-CSE-ConnectionGUID: Mn/P4QrTTGSdGixaoWS3vA==
X-CSE-MsgGUID: yLtS0jE6TauwKLkFSKypIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028450"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:17:56 -0800
X-CSE-ConnectionGUID: pLd4dpcsRJmAQQlAckRVpw==
X-CSE-MsgGUID: wx+jp34wRaiwzhaocqtH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893219"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:17:48 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	mateuszx.redzynia@intel.com
Subject: [PATCH 01/10] ASoC: SOF: sof-audio: Add a new op in struct sof_ipc_tplg_ops
Date: Wed,  4 Feb 2026 10:18:24 +0200
Message-ID: <20260204081833.16630-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
References: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a new host_config op in struct sof_ipc_tplg_ops and define it for
IPC4. This will be used to configure the host widget during prepare
after a suspend/resume or after an xrun.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 20 ++++++++++++++++++++
 sound/soc/sof/sof-audio.h     |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 1bc95e3e584c..d28aad71c7ed 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2004,6 +2004,25 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 	return ret;
 }
 
+static void sof_ipc4_host_config(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
+				 struct snd_sof_platform_stream_params *platform_params)
+{
+	struct sof_ipc4_copier *ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
+	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+	struct sof_ipc4_copier_data *copier_data = &ipc4_copier->data;
+	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+	u32 host_dma_id = platform_params->stream_tag - 1;
+
+	if (pipeline->use_chain_dma) {
+		pipeline->msg.primary &= ~SOF_IPC4_GLB_CHAIN_DMA_HOST_ID_MASK;
+		pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_HOST_ID(host_dma_id);
+		return;
+	}
+
+	copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+	copier_data->gtw_cfg.node_id |=	SOF_IPC4_NODE_INDEX(host_dma_id);
+}
+
 static int
 sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			       struct snd_pcm_hw_params *fe_params,
@@ -3929,4 +3948,5 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.dai_get_param = sof_ipc4_dai_get_param,
 	.tear_down_all_pipelines = sof_ipc4_tear_down_all_pipelines,
 	.link_setup = sof_ipc4_link_setup,
+	.host_config = sof_ipc4_host_config,
 };
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 03c8dd29e071..8596de1e8b95 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -209,6 +209,7 @@ struct sof_ipc_tplg_widget_ops {
  * @widget_setup: Function pointer for setting up setup in the DSP
  * @widget_free: Function pointer for freeing widget in the DSP
  * @dai_config: Function pointer for sending DAI config IPC to the DSP
+ * @host_config: Function pointer for setting the DMA ID for host widgets
  * @dai_get_param: Function pointer for getting the DAI parameter
  * @set_up_all_pipelines: Function pointer for setting up all topology pipelines
  * @tear_down_all_pipelines: Function pointer for tearing down all topology pipelines
@@ -230,6 +231,8 @@ struct sof_ipc_tplg_ops {
 	int (*widget_free)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 	int (*dai_config)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 			  unsigned int flags, struct snd_sof_dai_config_data *data);
+	void (*host_config)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
+			    struct snd_sof_platform_stream_params *platform_params);
 	int (*dai_get_param)(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int param_type);
 	int (*set_up_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
 	int (*tear_down_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
-- 
2.52.0

