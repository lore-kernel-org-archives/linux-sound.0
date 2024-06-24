Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99113C918
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231338; cv=none; b=AIrXlqjHayM74JlSoinGCrUgi/SLy8E+ijRkM0H3fRrNWRRIjgT3JpHbaiuF4Pzvi71Kuv8OMQe9TRz3MAK+62ACC+v1ZtZWJqm17lme623NhW77g71tRkRrzUzj/FPTXw9hZPG9PRXA2wxJziKJQyXIQYeNGnnhlbr1WmLuDl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231338; c=relaxed/simple;
	bh=nIHcHhTNgN+Q0m/O2aXaYPI4f07yUZ770Dxn2vDeXCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJ0LkKJGJ7RldnPnmyymfv3m7cyan5Y4NT0+M/+BjtYEZD4vNfNER5gdqkhyovyWTkDi7HTqXuZzFPD1lwOiHA64IeBq4JzXy7KYx8Yua4K9byg7C+odcrmwatqenQaxnBHDnd0zysEbe6SIIdmUoa+yW2HM1pk9oTMdXLAbgdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0tmGoVQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0tmGoVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231337; x=1750767337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nIHcHhTNgN+Q0m/O2aXaYPI4f07yUZ770Dxn2vDeXCg=;
  b=T0tmGoVQWgu5qx1JiElvD4hWTSSASXQwIHXPdp0EDHZypKR190JH9DGJ
   GZ46MTPkeIFQeoL2K96r7BpDKKAHYPvH45YZsL0VbNxLW1QKks82csb9d
   clBtSqQmbfV19cyNzKF1Nt+b4q3J///rxgf/4sNC5jtJSdah46VmBkAAB
   vdP4r9vNbAvRJqvzqWrcfKziOtKYJS9OKjVU3siNVtcVUQcfrUMrahyPl
   tTlczsleV6Uso5b4wePIDUTrP2mPbezPORM5LnHQif1HAUO4zT6yOSVch
   cttHb7M5eYDjOnbOfb+5rL7PtnJLVUjeJG75huAu6ZgFp3SPWtiZCqLem
   g==;
X-CSE-ConnectionGUID: UlwcWJBNRnOnhqjxOrouaA==
X-CSE-MsgGUID: cjOvBhyjRZy0nGllWqmPNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15888049"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15888049"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:15:37 -0700
X-CSE-ConnectionGUID: Ypu9WzvIRVKTEbPuwN1UCQ==
X-CSE-MsgGUID: SYcJB7xFT+aYaMm/ZrEtLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43358820"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:15:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/3] ASoC: SOF: ipc4-topology: Use single token list for the copiers
Date: Mon, 24 Jun 2024 14:15:17 +0200
Message-ID: <20240624121519.91703-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
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
index d123edfa3bae..ce2910f70e65 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3305,14 +3305,17 @@ static int sof_ipc4_link_setup(struct snd_sof_dev *sdev, struct snd_soc_dai_link
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
@@ -3320,16 +3323,6 @@ static enum sof_tokens pipeline_token_list[] = {
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
@@ -3366,23 +3359,23 @@ static enum sof_tokens process_token_list[] = {
 
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

