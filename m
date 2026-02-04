Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928B38E5DC
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193096; cv=none; b=exKtKhoOvOfHfdNeL6g1T+S5YzCE9H8gCzhbxxSA4knW7/Jk7JvQYGFYZilIRSpsuDh3gg8jT05/492hFQQfXsqtiF3hW4Ws2FhH5I373I2CPIlPm4q1ujyWaSNVLaQUjmV3WIMU911+xHtKfVDk3504O8sYj/7xDKjs+jFmU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193096; c=relaxed/simple;
	bh=qj8EYr9Oil7ASHAcM1DFft64lXYg3do9vuHEol/Js3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6Dn5y5o4rdjfrtB3tcKREjqMsH9x83G4z8R561q4t+8vQedx/Slwu70Phc21UsLZ8rtSpUvK79+d1GqzQchc9gE98liiNPwHgFNY1jZjs6atgxK+T3IL4/eEHZXjFMvdK5JaRixWbS2Vxub1bYx8susUQMxv7vl5C89mu5gk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtS05wwy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtS05wwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193097; x=1801729097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qj8EYr9Oil7ASHAcM1DFft64lXYg3do9vuHEol/Js3w=;
  b=BtS05wwyS0a8Ukq4yctgawoEwYw3ta9U0M6XTij9CotLk9Hkps+XszSQ
   Dvi1y+yZXzjDCxk/IXWnoQtI7XRks5URJfqYiYurkusji1dCAHVg23xza
   qJJHuC7+tDAfd8a8e2kLcgKVoOZiNQs/GAXfjphsyWJ8V7gpoBjyV7Bg7
   7v1sUPzRy5ucyXiFWSSx1hEM1SAIASp4Qhk/+fDyO7ftnrUUBcxPavxAm
   uox9oPBKmesSdgI1A3noFNooIJXF48qrSupq7AoxOhWre0GFHxPdlihZF
   wd7doa1nsm1QuHFulBtMqB/J5o/hB1cU7e8hdieyyAtpfn9w/wkPfxnZ3
   w==;
X-CSE-ConnectionGUID: G7/YoO1oTvaL1Q89/Iluvw==
X-CSE-MsgGUID: bJlbEbuHRpuCsow4KneWXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028471"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028471"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:07 -0800
X-CSE-ConnectionGUID: UzVeMHQ4Q0+GzM7EujtADw==
X-CSE-MsgGUID: JWXGzjafQ3KTSMz40qd02A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893232"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:17:53 -0800
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
Subject: [PATCH 02/10] ASoC: SOF: pcm: Split up widget prepare and setup
Date: Wed,  4 Feb 2026 10:18:25 +0200
Message-ID: <20260204081833.16630-3-peter.ujfalusi@linux.intel.com>
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

Widgets are set up in 2 steps, first ipc_prepare followed by the actual
IPC sent to the DSP to set up the widget. Split these 2 steps to do the
ipc_prepare during hw_params and the setting up in the prepare callback.
This will allow for future modifications to pipeline set up to be split
up between the FE and BE DAI prepare ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pcm.c       | 81 +++++++++++++++++++++++++++++++--------
 sound/soc/sof/sof-audio.c | 48 ++++++++++++++---------
 sound/soc/sof/sof-audio.h |  7 ++++
 3 files changed, 102 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 31879a11c33e..5b598d0940eb 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -88,9 +88,9 @@ sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_run
 
 		spcm->stream[dir].list = list;
 
-		ret = sof_widget_list_setup(sdev, spcm, params, platform_params, dir);
+		ret = sof_widget_list_prepare(sdev, spcm, params, platform_params, dir);
 		if (ret < 0) {
-			spcm_err(spcm, dir, "Widget list set up failed\n");
+			spcm_err(spcm, dir, "widget list prepare failed\n");
 			spcm->stream[dir].list = NULL;
 			snd_soc_dapm_dai_free_widgets(&list);
 			return ret;
@@ -100,15 +100,30 @@ sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_run
 	return 0;
 }
 
+static struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
+							      int comp_id)
+{
+	struct snd_sof_widget *swidget;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (comp_id == swidget->comp_id)
+			return swidget;
+	}
+
+	return NULL;
+}
+
 static int sof_pcm_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
-	struct snd_sof_platform_stream_params platform_params = { 0 };
+	struct snd_sof_platform_stream_params *platform_params;
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_sof_widget *host_widget;
 	struct snd_sof_pcm *spcm;
 	int ret;
 
@@ -144,7 +159,8 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 		spcm->prepared[substream->stream] = false;
 	}
 
-	ret = snd_sof_pcm_platform_hw_params(sdev, substream, params, &platform_params);
+	platform_params = &spcm->platform_params[substream->stream];
+	ret = snd_sof_pcm_platform_hw_params(sdev, substream, params, platform_params);
 	if (ret < 0) {
 		spcm_err(spcm, substream->stream, "platform hw params failed\n");
 		return ret;
@@ -152,12 +168,27 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 
 	/* if this is a repeated hw_params without hw_free, skip setting up widgets */
 	if (!spcm->stream[substream->stream].list) {
-		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, params, &platform_params,
+		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, params, platform_params,
 						      substream->stream);
 		if (ret < 0)
 			return ret;
 	}
 
+	if (!sdev->dspless_mode_selected) {
+		int host_comp_id = spcm->stream[substream->stream].comp_id;
+
+		host_widget = snd_sof_find_swidget_by_comp_id(sdev, host_comp_id);
+		if (!host_widget) {
+			spcm_err(spcm, substream->stream,
+				 "failed to find host widget with comp_id %d\n", host_comp_id);
+			return -EINVAL;
+		}
+
+		/* set the host DMA ID */
+		if (tplg_ops && tplg_ops->host_config)
+			tplg_ops->host_config(sdev, host_widget, platform_params);
+	}
+
 	/* create compressed page table for audio firmware */
 	if (runtime->buffer_changed) {
 		struct snd_dma_buffer *dmab = snd_pcm_get_dma_buf(substream);
@@ -169,14 +200,6 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 			return ret;
 	}
 
-	if (pcm_ops && pcm_ops->hw_params) {
-		ret = pcm_ops->hw_params(component, substream, params, &platform_params);
-		if (ret < 0)
-			return ret;
-	}
-
-	spcm->prepared[substream->stream] = true;
-
 	/* save pcm hw_params */
 	memcpy(&spcm->params[substream->stream], params, sizeof(*params));
 
@@ -281,6 +304,9 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 
 	ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream, true);
 
+	/* unprepare and free the list of DAPM widgets */
+	sof_widget_list_unprepare(sdev, spcm, substream->stream);
+
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
 	return ret;
@@ -291,7 +317,12 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
+	struct snd_sof_platform_stream_params *platform_params;
+	struct snd_soc_dapm_widget_list *list;
+	struct snd_pcm_hw_params *params;
 	struct snd_sof_pcm *spcm;
+	int dir = substream->stream;
 	int ret;
 
 	/* nothing to do for BE */
@@ -317,15 +348,33 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 			return ret;
 	}
 
-	/* set hw_params */
-	ret = sof_pcm_hw_params(component,
-				substream, &spcm->params[substream->stream]);
+	ret = sof_pcm_hw_params(component, substream, &spcm->params[substream->stream]);
 	if (ret < 0) {
 		spcm_err(spcm, substream->stream,
 			 "failed to set hw_params after resume\n");
 		return ret;
 	}
 
+	list = spcm->stream[dir].list;
+	params = &spcm->params[substream->stream];
+	platform_params = &spcm->platform_params[substream->stream];
+	ret = sof_widget_list_setup(sdev, spcm, params, platform_params, dir);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed widget list set up for pcm %d dir %d\n",
+			spcm->pcm.pcm_id, dir);
+		spcm->stream[dir].list = NULL;
+		snd_soc_dapm_dai_free_widgets(&list);
+		return ret;
+	}
+
+	if (pcm_ops && pcm_ops->hw_params) {
+		ret = pcm_ops->hw_params(component, substream, params, platform_params);
+		if (ret < 0)
+			return ret;
+	}
+
+	spcm->prepared[substream->stream] = true;
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index d55ee7343f8e..ac2d6660d2fa 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -660,6 +660,30 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 	return 0;
 }
 
+int sof_widget_list_prepare(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
+			    struct snd_pcm_hw_params *fe_params,
+			    struct snd_sof_platform_stream_params *platform_params,
+			    int dir)
+{
+	/*
+	 * Prepare widgets for set up. The prepare step is used to allocate memory, assign
+	 * instance ID and pick the widget configuration based on the runtime PCM params.
+	 */
+	return sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
+					dir, SOF_WIDGET_PREPARE);
+}
+
+void sof_widget_list_unprepare(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
+
+	/* unprepare the widget */
+	sof_walk_widgets_in_order(sdev, spcm, NULL, NULL, dir, SOF_WIDGET_UNPREPARE);
+
+	snd_soc_dapm_dai_free_widgets(&list);
+	spcm->stream[dir].list = NULL;
+}
+
 int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 			  struct snd_pcm_hw_params *fe_params,
 			  struct snd_sof_platform_stream_params *platform_params,
@@ -670,19 +694,10 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 	struct snd_soc_dapm_widget *widget;
 	int i, ret;
 
-	/* nothing to set up */
-	if (!list)
+	/* nothing to set up or setup has been already done */
+	if (!list || spcm->setup_done[dir])
 		return 0;
 
-	/*
-	 * Prepare widgets for set up. The prepare step is used to allocate memory, assign
-	 * instance ID and pick the widget configuration based on the runtime PCM params.
-	 */
-	ret = sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
-					dir, SOF_WIDGET_PREPARE);
-	if (ret < 0)
-		return ret;
-
 	/* Set up is used to send the IPC to the DSP to create the widget */
 	ret = sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
 					dir, SOF_WIDGET_SETUP);
@@ -737,6 +752,8 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 		}
 	}
 
+	spcm->setup_done[dir] = true;
+
 	return 0;
 
 widget_free:
@@ -754,18 +771,13 @@ int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int
 	int ret;
 
 	/* nothing to free */
-	if (!list)
+	if (!list || !spcm->setup_done[dir])
 		return 0;
 
 	/* send IPC to free widget in the DSP */
 	ret = sof_walk_widgets_in_order(sdev, spcm, NULL, NULL, dir, SOF_WIDGET_FREE);
 
-	/* unprepare the widget */
-	sof_walk_widgets_in_order(sdev, spcm, NULL, NULL, dir, SOF_WIDGET_UNPREPARE);
-
-	snd_soc_dapm_dai_free_widgets(&list);
-	spcm->stream[dir].list = NULL;
-
+	spcm->setup_done[dir] = false;
 	pipeline_list->count = 0;
 
 	return ret;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 8596de1e8b95..5f62a34582da 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -354,7 +354,9 @@ struct snd_sof_pcm {
 	struct snd_sof_pcm_stream stream[2];
 	struct list_head list;	/* list in sdev pcm list */
 	struct snd_pcm_hw_params params[2];
+	struct snd_sof_platform_stream_params platform_params[2];
 	bool prepared[2]; /* PCM_PARAMS set successfully */
+	bool setup_done[2]; /* the setup of the SOF PCM device is done */
 	bool pending_stop[2]; /* only used if (!pcm_ops->platform_stop_during_hw_free) */
 
 	/* Must be last - ends in a flex-array member. */
@@ -676,6 +678,11 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 			  struct snd_pcm_hw_params *fe_params,
 			  struct snd_sof_platform_stream_params *platform_params,
 			  int dir);
+int sof_widget_list_prepare(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
+			    struct snd_pcm_hw_params *fe_params,
+			    struct snd_sof_platform_stream_params *platform_params,
+			    int dir);
+void sof_widget_list_unprepare(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev *sdev,
 			 struct snd_sof_pcm *spcm);
-- 
2.52.0

