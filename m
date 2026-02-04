Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3D236AB53
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193116; cv=none; b=tjgcJQ171II5A5F3c5glf6azmim4Dc+2cKimA8nD7o74csdAN34d0FQV0oFHUHgts3lx3+0BSrzuJ+vLJQ9yRGnO39NxoS77G+iZ1Pk/Kopmiaz0UVftGmMoSu1ZrPl7Xjfnak3Q+Pu5p9+WK/zy0zWD+oV1VgApyHANexGgQKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193116; c=relaxed/simple;
	bh=8qqg5WvVwJoqeZ+BccVf3eN823YoynvH6mbB9BS58go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUqx2Ia5QRKSamRIekXHiwUwuMeWq3Fsd7aNhrqFd5lzPq+/OVkK7tXVEIGYj3mKcf985sx3F1UMkNJDFloJu5Zg3IwzjsXU+xqwcikP5d6Zo29rxPGRuHmG6DaYiWE/X2oXpnT7yKrxFM0GjWkvhNHQcXa1BNryiTIisweVz2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX27agzy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX27agzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193116; x=1801729116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8qqg5WvVwJoqeZ+BccVf3eN823YoynvH6mbB9BS58go=;
  b=VX27agzyc4O77kkZi8nxqYpipxoBwSEeDD/9QsmLZlXM8Vce5kuYaKfC
   87mJyfwPBYv06ZGpMtJBvKKM9af60CNQWFszada7AGUguPGqRCpBY84ar
   Zy2itA9dNYdR/DnTBW8555mYel0GjPJc9pw0A+1blgmYZtKKLE9tHngI4
   z/chFaF/NylkPjgJDH4PrLuaGM7KVupcGhenVzCmfyAiNT4O/cYRH76EC
   4qQvo+gB0156b4zLJhEkCpl6dwnwcmkW41UgpjyDTL4kGdTgmxb/HEY/A
   XhCDxQ1UK9umQJcEZugytRE86NSVc0A+232Mth1qoLQ8atGjtnjhvgNU+
   w==;
X-CSE-ConnectionGUID: v2bnsQ4vSaCruqJZCutAsA==
X-CSE-MsgGUID: linNTC7rQqqMeX3RjuAGrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028506"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028506"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:16 -0800
X-CSE-ConnectionGUID: Nx3bb5RESvu2bXTnKRN0Cg==
X-CSE-MsgGUID: 3TGDgGXxR2ear4X1VgSSqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893331"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:12 -0800
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
Subject: [PATCH 07/10] ASoC: SOF: sof-audio: Traverse paths with aggregated DAI widgets
Date: Wed,  4 Feb 2026 10:18:30 +0200
Message-ID: <20260204081833.16630-8-peter.ujfalusi@linux.intel.com>
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

Aggregated DAI widgets exist in topology for representation and are not
actually initialized in the firmware. But in preparation for using this
as a virtual DAI for loopback capture, make sure that we can traverse
the path from an aggregated DAI widget to the host widget.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index ac2d6660d2fa..efb5ed7d2b13 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -13,6 +13,21 @@
 #include "sof-audio.h"
 #include "ops.h"
 
+/*
+ * Check if a DAI widget is an aggregated DAI. Aggregated DAI's have names ending in numbers
+ * starting with 0. For example: in the case of a SDW speaker with 2 amps, the topology contains
+ * 2 DAI's names alh-copier.SDW1.Playback.0 and alh-copier-SDW1.Playback.1. In this case, only the
+ * DAI alh-copier.SDW1.Playback.0 is set up in the firmware. The other DAI,
+ * alh-copier.SDW1.Playback.1 in topology is for the sake of completeness to show aggregation for
+ * the speaker amp and does not need any firmware configuration.
+ */
+static bool is_aggregated_dai(struct snd_sof_widget *swidget)
+{
+	return (WIDGET_IS_DAI(swidget->id) &&
+		isdigit(swidget->widget->name[strlen(swidget->widget->name) - 1]) &&
+		swidget->widget->name[strlen(swidget->widget->name) - 1] != '0');
+}
+
 static bool is_virtual_widget(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
 			      const char *func)
 {
@@ -402,8 +417,9 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	if (is_virtual_widget(sdev, widget, __func__))
 		return;
 
-	/* skip if the widget is in use or if it is already unprepared */
-	if (!swidget || !swidget->prepared || swidget->use_count > 0)
+	/* skip if the widget in use or already unprepared or is an aggregated DAI */
+	if (!swidget || !swidget->prepared || swidget->use_count > 0 ||
+	    is_aggregated_dai(swidget))
 		goto sink_unprepare;
 
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
@@ -449,6 +465,10 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 	if (!swidget || !widget_ops[widget->id].ipc_prepare || swidget->prepared)
 		goto sink_prepare;
 
+	/* skip aggregated DAIs */
+	if (is_aggregated_dai(swidget))
+		goto sink_prepare;
+
 	/* prepare the source widget */
 	ret = widget_ops[widget->id].ipc_prepare(swidget, fe_params, platform_params,
 					     pipeline_params, dir);
@@ -493,6 +513,7 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
 				    int dir, struct snd_sof_pcm *spcm)
 {
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
+	struct snd_sof_widget *swidget;
 	struct snd_soc_dapm_path *p;
 	int err;
 	int ret = 0;
@@ -500,8 +521,11 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
 	if (is_virtual_widget(sdev, widget, __func__))
 		return 0;
 
-	if (widget->dobj.private) {
-		err = sof_widget_free(sdev, widget->dobj.private);
+	swidget = widget->dobj.private;
+
+	/* no need to free aggregated DAI widgets */
+	if (swidget && !is_aggregated_dai(swidget)) {
+		err = sof_widget_free(sdev, swidget);
 		if (err < 0)
 			ret = err;
 	}
@@ -545,7 +569,10 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 	if (swidget) {
 		int i;
 
-		ret = sof_widget_setup(sdev, widget->dobj.private);
+		if (is_aggregated_dai(swidget))
+			goto sink_setup;
+
+		ret = sof_widget_setup(sdev, swidget);
 		if (ret < 0)
 			return ret;
 
-- 
2.52.0

