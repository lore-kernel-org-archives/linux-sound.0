Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AFF493625
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945052; cv=none; b=uNKISvoYqWxV4/whgH6lS0n0J6ArqN+G7EKj1Sp4RdBJxhjiJzdkuGCuaeFSkkdZ9kEYHVB+QRaEohs5XZdmq2ZnHLrn27DDDkEu4Ce5XtoXSvdM4nkjE9bICPrrAR1crdWcHQQIP0sECHdCV9qEDDb492B3qFAt+7DGtj8H8WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945052; c=relaxed/simple;
	bh=i5tEUZ49J/v+xI360H0wqZVG7XM2k2VA6VS81ZDxzCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSlFFJpZpmMfd04J7T3JWijrGva7O66C0nVNp47KTT32zg73AgaqKkAYmApuq14UztsiDop6vXSOASBL/LEtIHx4fpET8nlHHxw44kNfu6oLZzIy+pifmEEpRcXaTnrA53s+C9P6xLDUJlKGlVleSBKBwCIMvNkM+a3lVP5Nxf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsosAZIx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsosAZIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945051; x=1820481051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5tEUZ49J/v+xI360H0wqZVG7XM2k2VA6VS81ZDxzCs=;
  b=OsosAZIx/7lWz8Gu0fAT6U5JF/tcLRs3xsvsF430JuI1AkYjjdCd/P/w
   adfmlDO9R87IDIqosmizpiX1a3kGgm28rCHJjfacAjuNGYbh1ghMWxJFG
   vLpBieaq8s/B8C9Yix+5D4G1Oandys4vkfmJDBCaYK4GLKhvE8Jlib5O/
   DbXEIYBh0l0QL1veucrPbb8VR4dWOXzptLxH0CNA41w+GunU9HSh9Y8AX
   07Ssdk9DQfAgmFOpwjfOJjBsSWBN6uWbap+rux5nW/s2CuKcWmU+w3x5v
   k1qn7BC6pEH5CT7g38WXoYdRoh7HcXf6YkRi37MI5z/B9cOnFUwckNFg7
   Q==;
X-CSE-ConnectionGUID: m/seO4qQRSWhmWyOX75wqA==
X-CSE-MsgGUID: BPJsulRaSN6IoYOARQlo4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200965"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200965"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:51 -0700
X-CSE-ConnectionGUID: 2gmucMK+RYWYacLwsooXXA==
X-CSE-MsgGUID: mUT1frRFRfWQzoo4M86qHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973528"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v2 24/24] ASoC: SOF: topology: Add support for decoder and encoder widgets
Date: Wed,  9 Sep 2026 12:09:49 +0300
Message-ID: <20260909090949.7503-25-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Decoder and encoder modules fall under process modules in SOF.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-topology.c | 11 +++++++++++
 sound/soc/sof/sof-audio.h     |  4 +++-
 sound/soc/sof/topology.c      |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 566913025cc7..74a6da9705da 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3589,6 +3589,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		msg = &asrc->msg;
 		break;
 	}
+	case snd_soc_dapm_decoder:
+	case snd_soc_dapm_encoder:
 	case snd_soc_dapm_effect:
 	{
 		struct sof_ipc4_process *process = swidget->private;
@@ -4361,6 +4363,15 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 				process_token_list, ARRAY_SIZE(process_token_list),
 				NULL, sof_ipc4_prepare_process_module,
 				NULL},
+	/* for all practical purposes a decoder is like an effect type widget */
+	[snd_soc_dapm_decoder] = {sof_ipc4_widget_setup_comp_process,
+				  sof_ipc4_widget_free_comp_process,
+				  process_token_list, ARRAY_SIZE(process_token_list),
+				  NULL, sof_ipc4_prepare_process_module, NULL},
+	[snd_soc_dapm_encoder] = {sof_ipc4_widget_setup_comp_process,
+				  sof_ipc4_widget_free_comp_process,
+				  process_token_list, ARRAY_SIZE(process_token_list),
+				  NULL, sof_ipc4_prepare_process_module, NULL},
 };
 
 const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 9dff4fea628e..b60246fd5869 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -43,7 +43,9 @@
 #define WIDGET_IS_AIF(id) ((id) == snd_soc_dapm_aif_in || (id) == snd_soc_dapm_aif_out)
 #define WIDGET_IS_AIF_OR_DAI(id) (WIDGET_IS_DAI(id) || WIDGET_IS_AIF(id))
 #define WIDGET_IS_COPIER(id) (WIDGET_IS_AIF_OR_DAI(id) || (id) == snd_soc_dapm_buffer)
-#define WIDGET_IS_PROCESS(id) ((id) == snd_soc_dapm_effect)
+#define WIDGET_IS_PROCESS(id) ((id) == snd_soc_dapm_effect ||	\
+			       (id) == snd_soc_dapm_decoder ||	\
+			       (id) == snd_soc_dapm_encoder)
 
 #define SOF_DAI_PARAM_INTEL_SSP_MCLK		0
 #define SOF_DAI_PARAM_INTEL_SSP_BCLK		1
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 8338133899ab..e2cb90133650 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1530,6 +1530,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		list_add(&dai->list, &sdev->dai_list);
 		swidget->private = dai;
 		break;
+	case snd_soc_dapm_decoder:
+	case snd_soc_dapm_encoder:
 	case snd_soc_dapm_effect:
 		/* check we have some tokens - we need at least process type */
 		if (le32_to_cpu(tw->priv.size) == 0) {
-- 
2.55.0

