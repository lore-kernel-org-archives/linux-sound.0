Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95F44E649
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125826; cv=none; b=XSSQmivphpmuQ8kvNRWOtz5UfWCYqDf4zN2Nud5YhQulQ8U8NMa1ajXoWoEWqTWLNklDc+FH5wadrELrF0Gh4+QuVbEnaKqOfVuE+3Xdfio4TsmlloAFl+SNfR4i/eSlb+jZHTPmwcqmXOAtdeIQNth5YaWycbhfNFkGTSeFiBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125826; c=relaxed/simple;
	bh=i5tEUZ49J/v+xI360H0wqZVG7XM2k2VA6VS81ZDxzCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/QiA3A25gsWK5/ELyItbAomHHJIlL7u4zb/Uh6pwhG0VNNvGc9CxKRVIPGaUymsfArszKJ2KuR2E8FuRFHbE/ov6cxqT8gLQvdBemSuM3DpJv1i0YB+87RfxpER87Un/E6JiIy3lVkEMwogIZcINq3fzHNnJbkZV31k3aed4QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPyJmzk9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPyJmzk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125819; x=1820661819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5tEUZ49J/v+xI360H0wqZVG7XM2k2VA6VS81ZDxzCs=;
  b=lPyJmzk9WcZ/rNCiXvrUlem5YjM96C3/2ehfAaXCs4IYlR88HbP5qthL
   vf4jdD49NWdvgDwASfOmibFKI87dbo06oEryIPaxtFLECSODbPWHPiUz0
   MJq51y5DTvEuG1pPNJKxZuj37qzC7tzrWQWl0Ry4W4jaQRAKimRJ6lcTY
   mpVQ6BU7U1Ph1fxwskC5fbZlQc71ugp2RwBeuFL2hPtDZqcgyLMEbJN4z
   BaGZ7bbUCWyMGfLcH0bqXYd1o3xM8T3e4BGi0Ka8+SB/7pcgK+axxf0Ig
   DmSZNrNf7iWzQthzP5ws3I4ZCRVGQsE50aVy0V+nr5GmiOowTaO11PA00
   g==;
X-CSE-ConnectionGUID: UC8uQMqlQm+MucA5eeoIUg==
X-CSE-MsgGUID: om4QW/0lSPWmgxNCDrvycQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750118"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750118"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:59 -0700
X-CSE-ConnectionGUID: TY1MDLlQTEmDRC3KbKBM+Q==
X-CSE-MsgGUID: tJ7dDtC/QzadaL8JCn1Mhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213542"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:57 -0700
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
Subject: [PATCH v3 26/26] ASoC: SOF: topology: Add support for decoder and encoder widgets
Date: Fri, 11 Sep 2026 14:21:52 +0300
Message-ID: <20260911112152.28528-27-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
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

