Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824B622F02
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819187; cv=none; b=gQSVwNuJWWTe0G1cg1kFiGsNTSrlX7Svs5m4ZAL0lOj7JR8ivjqp2HNaCxLh84a20d4/Psfiw9aocGIdLv+Qowib4C7gLT2KseaQW7nF5RU11rb/sbqTdLikg7LNjxiKJP5uzV/9vurY2YzQbzTKt5gJEQ1uuUcq4DfqwvNAw1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819187; c=relaxed/simple;
	bh=Lz3/IdjEJJ8GNbC0uRSoVlLagsLEtOI+blfdYrcCCWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H0Tajw+pIabRiSM0b3gTrYiyan/AvlIIsesLdV/NCyW0MkrkEKZGExtzGTPA+OzwmStdGFqv4sNyArxHKIXWZyGhp2NXoBqqNS7DEtrs1Bz1/xXCgUb9Ekf/73IwrcA4XAW0bTAv5C88cbTFh74tHyYC6Fmbro3rvilCzCPFKOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtVDwUb5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtVDwUb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819186; x=1739355186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lz3/IdjEJJ8GNbC0uRSoVlLagsLEtOI+blfdYrcCCWo=;
  b=BtVDwUb503i7LT5nESsQ9IzyjTxApeSMj3QNIU52Er9VSBElTrX4NJTX
   /K5bm7DcgI4jutTgjgSOLYVEn0lOAkC/F5OkWgrkbG9wP9Td17STZjPZV
   5Wxr2ZWtNbey2+N+fxq7C2TvBH9/5DNPtyyhN/QDXcHJ9U3oOb+TfJSMI
   uUo5QkqbLyLBxGMpV2opoRewjDZbc4qQX90ntukeTm+3eVK/nVjnieq74
   iA8ZpJix9KDDlw5ErXN9OCStlBeekWt8+9Am0s3AA7yIOtVBQ+ifPCk1R
   +mS6afqvCWas7vJZtZNqDGWVeQmXqXgC0g02UG5ft1UJZbWxSjN1kv6QH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260187"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260187"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498082"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:04 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 11/15] ASoC: SOF: topology: Parse DAI type token for dspless mode
Date: Tue, 13 Feb 2024 12:12:43 +0200
Message-ID: <20240213101247.28887-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Starting with LunarLake, the dspless mode can handle SoundWire/ALH,
DMIC and SSPs, so we need to identify the dai type from topology.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c |  1 +
 sound/soc/sof/sof-audio.h     |  1 +
 sound/soc/sof/topology.c      | 12 ++++++++++++
 3 files changed, 14 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 98e2f83b1c09..43d4abd79f44 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -549,6 +549,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	dev_dbg(scomp->dev, "dai %s node_type %u dai_type %u dai_index %d\n", swidget->widget->name,
 		node_type, ipc4_copier->dai_type, ipc4_copier->dai_index);
 
+	dai->type = ipc4_copier->dai_type;
 	ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
 
 	pipe_widget = swidget->spipe->pipe_widget;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index f98242a404db..9ea2ac5adac7 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -514,6 +514,7 @@ struct snd_sof_route {
 struct snd_sof_dai {
 	struct snd_soc_component *scomp;
 	const char *name;
+	u32 type;
 
 	int number_configs;
 	int current_config;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 915c2e88e32b..bcdb499c96a0 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2354,7 +2354,10 @@ static int sof_dspless_widget_ready(struct snd_soc_component *scomp, int index,
 				    struct snd_soc_tplg_dapm_widget *tw)
 {
 	if (WIDGET_IS_DAI(w->id)) {
+		static const struct sof_topology_token dai_tokens[] = {
+			{SOF_TKN_DAI_TYPE, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_dai_type, 0}};
 		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+		struct snd_soc_tplg_private *priv = &tw->priv;
 		struct snd_sof_widget *swidget;
 		struct snd_sof_dai *sdai;
 		int ret;
@@ -2369,6 +2372,15 @@ static int sof_dspless_widget_ready(struct snd_soc_component *scomp, int index,
 			return -ENOMEM;
 		}
 
+		ret = sof_parse_tokens(scomp, &sdai->type, dai_tokens, ARRAY_SIZE(dai_tokens),
+				       priv->array, le32_to_cpu(priv->size));
+		if (ret < 0) {
+			dev_err(scomp->dev, "Failed to parse DAI tokens for %s\n", tw->name);
+			kfree(swidget);
+			kfree(sdai);
+			return ret;
+		}
+
 		ret = sof_connect_dai_widget(scomp, w, tw, sdai);
 		if (ret) {
 			kfree(swidget);
-- 
2.43.0

