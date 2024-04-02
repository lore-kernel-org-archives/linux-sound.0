Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37A612CD82
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071125; cv=none; b=mwoiV+WHcSI5ctMJWaNSfo6tTfQfCTJ0+5zypcy2RTOkiQhMLPo9HmGdpvJOxLPBElCK5XusVIKlmGNw2B0nqHbnCwu4gzoC/8Ah9wRXBucJYmxKaDh9F9hwCV6/uZP7zibHzBKPlx2wt282CR/MlRWRspVFR2KlgpdtuuP5uFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071125; c=relaxed/simple;
	bh=czAjr/eYzpK29kh91QDsvNPki5Hw4h0Zlv7iYd4PYec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=imWQCEmppGnjR7sQZ2X9YbnTy/uehyyTlcZKWHIv0lVhc5SvimNZhQCPuiySAnT8deNBzOWvtMdDOymbl3QACbigrHfuRxUjfMglmX7y95Qpl4Xv3lELaNK8tX6Qr/Fu5zgz/DENWX1kqF04J0ddR8jJbBE8/ADEkXQAlGVhDMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8rAWeTa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8rAWeTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071124; x=1743607124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=czAjr/eYzpK29kh91QDsvNPki5Hw4h0Zlv7iYd4PYec=;
  b=M8rAWeTaPQF4CIPrx1+Pa2/HxPhR2ntvBX+5ZpawE1C6w+bPPzB5PsmE
   eteMns4PayfSey9OeVSAXGlL5ghxnYv7eIhOtAsYmy91ycGFLprg72+gV
   jr/afDv+RX51X/iT6+/ZLY3Ood9HZqqZHL2caR+nzomp+XHhIvFBqnmcD
   xL4MdJK8oANYVlv/+i1AHsPKYUH80iJmPIW3L7H8LpBAwjrEdQOPe5u08
   ngyxJgaYvq6LDinCZrGwvaHdSw8zGaPdyvXF/Iw+ffspBmprCCDY/1gbV
   SERLKttkGHtB8ax6eVMHx1R6QttGCpnci09JoHboNFztEwIjWtBgbuCyP
   A==;
X-CSE-ConnectionGUID: jsLcpQ4yS6W728KtKRuP9g==
X-CSE-MsgGUID: PZhuTxgHTDCfSqCbXTPswQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730080"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:43 -0700
X-CSE-ConnectionGUID: FK8obrWjRzSQweIer0vwmQ==
X-CSE-MsgGUID: 3pFlMhjaT/2Fe4InC68U7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796516"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 10/17] ASoC: SOF: IPC4: extend dai_data with node_id
Date: Tue,  2 Apr 2024 10:18:21 -0500
Message-Id: <20240402151828.175002-11-pierre-louis.bossart@linux.intel.com>
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

The node_id value needs to be handled specifically for ALH.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 1 +
 sound/soc/sof/intel/hda.c     | 1 +
 sound/soc/sof/ipc4-topology.c | 8 ++++++--
 sound/soc/sof/sof-audio.h     | 1 +
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 5e3229c8fe13..86c2325e5949 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -491,6 +491,7 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	int i;
 
 	data.dai_index = (link_id << 8) | cpu_dai->id;
+	data.dai_node_id = intel_alh_id;
 	ret = non_hda_dai_hw_params_data(substream, params, cpu_dai, &data, flags);
 	if (ret < 0) {
 		dev_err(cpu_dai->dev, "%s: non_hda_dai_hw_params failed %d\n", __func__, ret);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 63f1cf3b915f..ae1a38f20bdb 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -145,6 +145,7 @@ static int sdw_params_stream(struct device *dev,
 
 	data.dai_index = (params_data->link_id << 8) | d->id;
 	data.dai_data = params_data->alh_stream_id;
+	data.dai_node_id = data.dai_data;
 
 	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_PARAMS, &data);
 }
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 28ab687a1d9c..6b9b16f3157e 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2857,7 +2857,11 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	case SOF_DAI_INTEL_HDA:
 		gtw_attr = ipc4_copier->gtw_attr;
 		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
-		fallthrough;
+		if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
+			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_data);
+		}
+		break;
 	case SOF_DAI_INTEL_ALH:
 		/*
 		 * Do not clear the node ID when this op is invoked with
@@ -2866,7 +2870,7 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 		 */
 		if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
 			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
-			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_data);
+			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_node_id);
 		}
 		break;
 	case SOF_DAI_INTEL_DMIC:
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 86bbb531e142..7c08f915b35b 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -91,6 +91,7 @@ struct snd_sof_pcm;
 struct snd_sof_dai_config_data {
 	int dai_index;
 	int dai_data; /* contains DAI-specific information */
+	int dai_node_id; /* contains DAI-specific information for Gateway configuration */
 };
 
 /**
-- 
2.40.1

