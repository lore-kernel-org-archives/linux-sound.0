Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A91D38B7D0
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193153; cv=none; b=r9R1Zr9JM22YsDj/R/8b/r/tcRpbKCTG+C4ylf4ZpBr53bzIOqtcFQXH4MeOXkufPyqiepylR71W8JmRnKNuIaO4xCBw7h1olBNPT3f9SaYuKn6l/iYpEdSWEkkx4I8dA8gLEWTe1xUDjAScnTjTJ+4Vcqo6CZ1Vbg0n94y0PO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193153; c=relaxed/simple;
	bh=Sqizvny4fIRBr0v5BOLkuiaFKvF1H/aCpVJ/SSZoVMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvjoCjQ7yXBoyEqVN+FciG02TMbhDN1PnX8BWVI7zarvqajoHB8begISijK75Qxsemw+qcF5LCPV3LxKTr9x2ixrhPeKRhfxXNXjpXHbIYnic2lIwsCNF0yw4FNtttEyZOMO3O1L5CStUXGja3Dlj77kownv0bgWzG84yFPbkGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjnf8jwB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjnf8jwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193154; x=1801729154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sqizvny4fIRBr0v5BOLkuiaFKvF1H/aCpVJ/SSZoVMY=;
  b=bjnf8jwBZ0mOS3Nis1HlTna2xDcac9xnYSwKSik1fjNo+1VQgcf08qK0
   IJiSR4uoGdTgtEaBGe9r7sqWZN4FIsJU2x8kxTFtgGJhUte/7Kr4GOuNP
   kutemHzh+eAlt3v7BPdFz6YYYD1ISKrqYGdd5/WrYQZgjEP+NoqVXcvKF
   jAEpQ7i4IBkZrlh2dUitngDq2ut/HXKufInrrTUW7/BuFZDr74WsA0EKE
   uk+WZsX0s92sm8XHBGuz9zmC1+PU70bzyttVsuAf4u/jshK3oOwPi+GCx
   kDXstBevWT9jrL0g1d0D3X3IJPv7hHUPK3cJGtN52vemK79aU9MtFtDU+
   w==;
X-CSE-ConnectionGUID: ohthV2KkSxWel8gKlDx1wQ==
X-CSE-MsgGUID: cfQyJu/ZRDml8xnEs4MyrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028519"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028519"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:18 -0800
X-CSE-ConnectionGUID: dwJXDU19TbKb4Suu4Q1pBg==
X-CSE-MsgGUID: Jfc+0Ui3TiCvlbtG8WK0QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893351"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:15 -0800
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
Subject: [PATCH 08/10] ASoC: SOF: sof-audio: Add support for loopback capture
Date: Wed,  4 Feb 2026 10:18:31 +0200
Message-ID: <20260204081833.16630-9-peter.ujfalusi@linux.intel.com>
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

An example of a DAI-less loopback pipeline would be the echo
reference capture in the speaker playback path. This pipeline
is set up as follows:

Host(Playback) -> mixin -> mixout -> gain -> module-copier -> DAI
						|
						V
		Host(Capture) <-  Process module <- virtual DAI

In the above example, the virtual DAI exploits the concept of an
aggregated DAI (one with a non-zero DAI ID) in topology to enable this
pipeline to work with DPCM. A virtual DAI is a DAI widget with a
non-zero DAI ID and hence is skipped when traversing the list of DAPM
widgets during widget prepare/set/up/free/unprepare. The process module
in the above pipeline generates 0's that are captured by the echo
reference PCM.  When the playback path is active, the process module acts
as a passthrough module to allow the playback samples to be passthrough
to the capture host.

In order for these pipelines to work properly, the logic for
setting/preparing/freeing/unpreparing the widgets needs to be amended to
make sure that only the widgets that are in the pipeline in the same
direction as the PCM being started are set up. For example, when the
playback PCM is started, the capture pipeline widgets also show up in
the list of connected DAPM widgets but they shouldn't be set up yet
because the echo reference capture PCM hasn't been started yet.
Alternatively, when the echo reference capture PCM is started, the
playback pipeline widgets should not be setup.

Finally, the last step needed to put this all together is the set the
routes for widgets connecting the playback and the capture pipelines
when both are active.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 152 +++++++++++++++++++++++++-------------
 1 file changed, 100 insertions(+), 52 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index efb5ed7d2b13..acf56607bc9c 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -269,6 +269,10 @@ int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsourc
 	    is_virtual_widget(sdev, sink_widget->widget, __func__))
 		return 0;
 
+	/* skip route if source/sink widget is not set up */
+	if (!src_widget->use_count || !sink_widget->use_count)
+		return 0;
+
 	/* find route matching source and sink widgets */
 	list_for_each_entry(sroute, &sdev->route_list, list)
 		if (sroute->src_widget == src_widget && sroute->sink_widget == sink_widget) {
@@ -297,10 +301,34 @@ int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsourc
 	return 0;
 }
 
+static bool sof_widget_in_same_direction(struct snd_sof_widget *swidget, int dir)
+{
+	return swidget->spipe->direction == dir;
+}
+
+static int sof_set_up_same_dir_widget_routes(struct snd_sof_dev *sdev,
+					     struct snd_soc_dapm_widget *wsource,
+					     struct snd_soc_dapm_widget *wsink)
+{
+	struct snd_sof_widget *src_widget = wsource->dobj.private;
+	struct snd_sof_widget *sink_widget = wsink->dobj.private;
+
+	/*
+	 * skip setting up route if source and sink are in different directions (ex. playback and
+	 * echo ref) if the direction is set in topology. These will be set up later. It is enough
+	 * to check if the direction_valid is set for one of the widgets as all widgets will have
+	 * the direction set in topology if one is set.
+	 */
+	if (sink_widget->spipe && sink_widget->spipe->direction_valid &&
+	    !sof_widget_in_same_direction(sink_widget, src_widget->spipe->direction))
+		return 0;
+
+	return sof_route_setup(sdev, wsource, wsink);
+}
+
 static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 					  struct snd_soc_dapm_widget_list *list, int dir)
 {
-	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_soc_dapm_widget *widget;
 	struct snd_sof_route *sroute;
 	struct snd_soc_dapm_path *p;
@@ -323,7 +351,8 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 					continue;
 
 				if (p->sink->dobj.private) {
-					ret = sof_route_setup(sdev, widget, p->sink);
+					ret = sof_set_up_same_dir_widget_routes(sdev, widget,
+										p->sink);
 					if (ret < 0)
 						return ret;
 				}
@@ -339,7 +368,8 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 					continue;
 
 				if (p->source->dobj.private) {
-					ret = sof_route_setup(sdev, p->source, widget);
+					ret = sof_set_up_same_dir_widget_routes(sdev, p->source,
+										widget);
 					if (ret < 0)
 						return ret;
 				}
@@ -355,7 +385,6 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 	 */
 	list_for_each_entry(sroute, &sdev->route_list, list) {
 		bool src_widget_in_dapm_list, sink_widget_in_dapm_list;
-		struct snd_sof_widget *swidget;
 
 		if (sroute->setup)
 			continue;
@@ -364,40 +393,37 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 		sink_widget_in_dapm_list = widget_in_list(list, sroute->sink_widget->widget);
 
 		/*
-		 * if both source and sink are in the DAPM list, the route must already have been
-		 * set up above. And if neither are in the DAPM list, the route shouldn't be
-		 * handled now.
+		 * no need to set up the route if both the source and sink widgets are not in the
+		 * DAPM list
 		 */
-		if (src_widget_in_dapm_list == sink_widget_in_dapm_list)
+		if (!src_widget_in_dapm_list && !sink_widget_in_dapm_list)
 			continue;
 
 		/*
-		 * At this point either the source widget or the sink widget is in the DAPM list
-		 * with a route that might need to be set up. Check the use_count of the widget
-		 * that is not in the DAPM list to confirm if it is in use currently before setting
-		 * up the route.
+		 * set up the route only if both the source and sink widgets are in the DAPM list
+		 * but are in different directions. The ones in the same direction would already
+		 * have been set up in the previous loop.
 		 */
-		if (src_widget_in_dapm_list)
-			swidget = sroute->sink_widget;
-		else
-			swidget = sroute->src_widget;
+		if (src_widget_in_dapm_list && sink_widget_in_dapm_list) {
+			struct snd_sof_widget *src_widget, *sink_widget;
 
-		scoped_guard(mutex, &swidget->setup_mutex) {
-			if (!swidget->use_count)
-				continue;
+			src_widget = sroute->src_widget->widget->dobj.private;
+			sink_widget = sroute->sink_widget->widget->dobj.private;
 
-			if (tplg_ops && tplg_ops->route_setup) {
-				/*
-				 * this route will get freed when either the
-				 * source widget or the sink widget is freed
-				 * during hw_free
-				 */
-				ret = tplg_ops->route_setup(sdev, sroute);
-				if (!ret)
-					sroute->setup = true;
-			}
+			/*
+			 * it is enough to check if the direction_valid is set for one of the
+			 * widgets as all widgets will have the direction set in topology if one
+			 * is set.
+			 */
+			if (src_widget && sink_widget &&
+			    src_widget->spipe && src_widget->spipe->direction_valid &&
+			    sof_widget_in_same_direction(sink_widget, src_widget->spipe->direction))
+				continue;
 		}
 
+		ret = sof_route_setup(sdev, sroute->src_widget->widget,
+				      sroute->sink_widget->widget);
+
 		if (ret < 0)
 			return ret;
 	}
@@ -407,7 +433,7 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 
 static void
 sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
-			      struct snd_soc_dapm_widget_list *list)
+			      struct snd_soc_dapm_widget_list *list, int dir)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_widget *swidget = widget->dobj.private;
@@ -417,9 +443,15 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	if (is_virtual_widget(sdev, widget, __func__))
 		return;
 
-	/* skip if the widget in use or already unprepared or is an aggregated DAI */
-	if (!swidget || !swidget->prepared || swidget->use_count > 0 ||
-	    is_aggregated_dai(swidget))
+	if (!swidget)
+		goto sink_unprepare;
+
+	if (swidget->spipe && swidget->spipe->direction_valid &&
+	    !sof_widget_in_same_direction(swidget, dir))
+		return;
+
+	/* skip widgets in use, those already unprepared or aggregated DAIs */
+	if (!swidget->prepared || swidget->use_count > 0 || is_aggregated_dai(swidget))
 		goto sink_unprepare;
 
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
@@ -434,9 +466,10 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 		if (!widget_in_list(list, p->sink))
 			continue;
+
 		if (!p->walking && p->sink->dobj.private) {
 			p->walking = true;
-			sof_unprepare_widgets_in_path(sdev, p->sink, list);
+			sof_unprepare_widgets_in_path(sdev, p->sink, list, dir);
 			p->walking = false;
 		}
 	}
@@ -458,15 +491,20 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 	if (is_virtual_widget(sdev, widget, __func__))
 		return 0;
 
+	if (!swidget)
+		goto sink_prepare;
+
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
 	if (!widget_ops)
 		return 0;
 
-	if (!swidget || !widget_ops[widget->id].ipc_prepare || swidget->prepared)
-		goto sink_prepare;
+	if (swidget->spipe && swidget->spipe->direction_valid &&
+	    !sof_widget_in_same_direction(swidget, dir))
+		return 0;
 
-	/* skip aggregated DAIs */
-	if (is_aggregated_dai(swidget))
+	/* skip widgets already prepared or aggregated DAI widgets*/
+	if (!widget_ops[widget->id].ipc_prepare || swidget->prepared ||
+	    is_aggregated_dai(swidget))
 		goto sink_prepare;
 
 	/* prepare the source widget */
@@ -484,6 +522,7 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 		if (!widget_in_list(list, p->sink))
 			continue;
+
 		if (!p->walking && p->sink->dobj.private) {
 			p->walking = true;
 			ret = sof_prepare_widgets_in_path(sdev, p->sink,  fe_params,
@@ -513,7 +552,7 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
 				    int dir, struct snd_sof_pcm *spcm)
 {
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
-	struct snd_sof_widget *swidget;
+	struct snd_sof_widget *swidget = widget->dobj.private;
 	struct snd_soc_dapm_path *p;
 	int err;
 	int ret = 0;
@@ -521,15 +560,21 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
 	if (is_virtual_widget(sdev, widget, __func__))
 		return 0;
 
-	swidget = widget->dobj.private;
+	if (!swidget)
+		goto sink_free;
 
-	/* no need to free aggregated DAI widgets */
-	if (swidget && !is_aggregated_dai(swidget)) {
-		err = sof_widget_free(sdev, swidget);
-		if (err < 0)
-			ret = err;
-	}
+	if (swidget->spipe && swidget->spipe->direction_valid &&
+	    !sof_widget_in_same_direction(swidget, dir))
+		return 0;
 
+	/* skip aggregated DAIs */
+	if (is_aggregated_dai(swidget))
+		goto sink_free;
+
+	err = sof_widget_free(sdev, widget->dobj.private);
+	if (err < 0)
+		ret = err;
+sink_free:
 	/* free all widgets in the sink paths even in case of error to keep use counts balanced */
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 		if (!p->walking) {
@@ -569,6 +614,11 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 	if (swidget) {
 		int i;
 
+		if (swidget->spipe && swidget->spipe->direction_valid &&
+		    !sof_widget_in_same_direction(swidget, dir))
+			return 0;
+
+		/* skip aggregated DAIs */
 		if (is_aggregated_dai(swidget))
 			goto sink_setup;
 
@@ -634,15 +684,13 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 		return 0;
 
 	for_each_dapm_widgets(list, i, widget) {
-		if (is_virtual_widget(sdev, widget, __func__))
-			continue;
-
-		/* starting widget for playback is AIF type */
+		/* starting widget for playback is of AIF type */
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK && widget->id != snd_soc_dapm_aif_in)
 			continue;
 
 		/* starting widget for capture is DAI type */
-		if (dir == SNDRV_PCM_STREAM_CAPTURE && widget->id != snd_soc_dapm_dai_out)
+		if (dir == SNDRV_PCM_STREAM_CAPTURE && widget->id != snd_soc_dapm_dai_out &&
+		    widget->id != snd_soc_dapm_output)
 			continue;
 
 		switch (op) {
@@ -672,7 +720,7 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 			break;
 		}
 		case SOF_WIDGET_UNPREPARE:
-			sof_unprepare_widgets_in_path(sdev, widget, list);
+			sof_unprepare_widgets_in_path(sdev, widget, list, dir);
 			break;
 		default:
 			dev_err(sdev->dev, "Invalid widget op %d\n", op);
-- 
2.52.0

