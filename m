Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7711C1A4F25
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083620; cv=none; b=Y3etYh94AZ5G836zSb9ehbBOqtu6ntYiuTzmZ5BvxGn67UX+dcwVWWRZIvYXO3VQS8B6k0AzOfGkseM7ahU6+J4ipYR1tpXwmlS8TE6cz6SnJtzLv+ZRWEHnQGGUdNkXFnIRk3PnALEi2ER2p151XC0GxL5N3yFnOSM47vMoQao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083620; c=relaxed/simple;
	bh=bNJKplLYROG7iY2UVl/qkk8WvYjXREaWfAYjH+1ihvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=klc8ZFw+4HVtlK6Mt3hpcx0cgMdRdcuqoPZSxdmad3LeF/7MlZKDvmVxYc1NbFE1dxJ554nJhPo+fiO2wFTx/KoTmcHbvEOySW9R7HqIKG/9r3Y4a/1PaCMSSk5kGqH3ODLHMlBifq7hzv7D3xOhE4EdqCue04kuYbWMY5VcoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdOuZ4Qy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdOuZ4Qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083619; x=1751619619;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bNJKplLYROG7iY2UVl/qkk8WvYjXREaWfAYjH+1ihvo=;
  b=WdOuZ4Qy1R7HFG9XvwnNkRG75zv3/OCcTTZSotirhNSHax7LQoJNj6jN
   /bYl1NzrUMzi86HEf66dDrrMGN1Gkl+FABmajMJJNcnsuK9pCwyQ2RhWK
   HxzWmvk2k/mk1YUdmdRmA/QqqGpztdjSvDQ3LZqksrSU0OrXxlGzPGoOF
   Obl4f8HURN80hSAWvq7+H0zhtYO23dnH+a23Z94HROE4rjkCFIMvzCeux
   5XwMxAEbiTb4OrcdAuVDZnyEPaNTIc/OMR0R3BGnJ2n033XUXRLN7ZMfH
   S4MgMx8W/0sTBloTiafZaKJy0kd0GBTi+ib/dVPZ7iL70rLdFi6gmUwDp
   Q==;
X-CSE-ConnectionGUID: BfuFrLoDRDKlTN1LwgDqYA==
X-CSE-MsgGUID: AeLR8M59TC2PcrN8ChzkjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34799211"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34799211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 02:00:12 -0700
X-CSE-ConnectionGUID: 6xglVsNnRnKN3X+kStJlvw==
X-CSE-MsgGUID: 4uYD7ImZT/2czNmTzN99zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="50979500"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.90])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 02:00:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: ipc4-topology: Use single token list for the copiers
Date: Thu,  4 Jul 2024 10:59:44 +0200
Message-ID: <20240704085944.371450-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

There is no need to keep separate token list for dai and 'common' copier
token list when the 'common' list is actually the aif list, the
SOF_COPIER_DEEP_BUFFER_TOKENS are not applicable for buffers.

We could have separate lists for all types but it is probably simpler to
just use a single list for all types of copiers. Function specific tokens
will be only parsed by function specific code anyways.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 7755c01735f5..90f6856ee80c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3307,14 +3307,17 @@ static int sof_ipc4_link_setup(struct snd_sof_dev *sdev, struct snd_soc_dai_link
 	return 0;
 }
 
-static enum sof_tokens common_copier_token_list[] = {
+/* Tokens needed for different copier variants (aif, dai and buffer) */
+static enum sof_tokens copier_token_list[] = {
 	SOF_COMP_TOKENS,
+	SOF_COPIER_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
 	SOF_OUT_AUDIO_FORMAT_TOKENS,
-	SOF_COPIER_DEEP_BUFFER_TOKENS,
-	SOF_COPIER_TOKENS,
 	SOF_COMP_EXT_TOKENS,
+
+	SOF_COPIER_DEEP_BUFFER_TOKENS,	/* for AIF copier */
+	SOF_DAI_TOKENS,			/* for DAI copier */
 };
 
 static enum sof_tokens pipeline_token_list[] = {
@@ -3322,16 +3325,6 @@ static enum sof_tokens pipeline_token_list[] = {
 	SOF_PIPELINE_TOKENS,
 };
 
-static enum sof_tokens dai_token_list[] = {
-	SOF_COMP_TOKENS,
-	SOF_AUDIO_FMT_NUM_TOKENS,
-	SOF_IN_AUDIO_FORMAT_TOKENS,
-	SOF_OUT_AUDIO_FORMAT_TOKENS,
-	SOF_COPIER_TOKENS,
-	SOF_DAI_TOKENS,
-	SOF_COMP_EXT_TOKENS,
-};
-
 static enum sof_tokens pga_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_GAIN_TOKENS,
@@ -3368,23 +3361,23 @@ static enum sof_tokens process_token_list[] = {
 
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
-				  common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				  copier_token_list, ARRAY_SIZE(copier_token_list),
 				  NULL, sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_aif_out] = {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
-				  common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				  copier_token_list, ARRAY_SIZE(copier_token_list),
 				  NULL, sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_dai_in] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
-				 dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
+				 copier_token_list, ARRAY_SIZE(copier_token_list), NULL,
 				 sof_ipc4_prepare_copier_module,
 				 sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_dai_out] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
-				  dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
+				  copier_token_list, ARRAY_SIZE(copier_token_list), NULL,
 				  sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_buffer] = {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
-				 common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				 copier_token_list, ARRAY_SIZE(copier_token_list),
 				 NULL, sof_ipc4_prepare_copier_module,
 				 sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline,
-- 
2.43.0

