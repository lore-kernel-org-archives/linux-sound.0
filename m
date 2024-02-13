Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6F241F9
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819182; cv=none; b=iJPCYKxic30zRnqsdAfBsTlGN1ynC32Gw0ZKotNsZyiLSXw0DfxxrLDEmvdjWANRo3qIEKzns8iW7PzCudQkvBkze6023G5WaLbpsxrBQcUg+Gskbj1Z3zdExoysBY/Q1qALtGW34IWPlSQ2No+Tk0zpaYzQarl/+bxpV6BCaEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819182; c=relaxed/simple;
	bh=TtVWURYSDM/9/pAPEUSwVQU/A3+nju9l0t6gq/HZ5o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVtNaMbbu0DmPiUgmHgk0fm/8YRpkdzQpgHj3x0ZHwm4SmwQ1+rHrEky3mw6v13ujCzEdMZSB/BPgftQEVi6kKIHqMdUsAU762yuSbTJOwc1d9a+qMovqTBISaQ/Kzvog9LkvqlWGjsisxRhJYytOYkITt4ghpAerRSpTfdaz4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtCVtB1k; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtCVtB1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819181; x=1739355181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TtVWURYSDM/9/pAPEUSwVQU/A3+nju9l0t6gq/HZ5o4=;
  b=KtCVtB1kgW7qs7vXUkYUcptykpfcQ+I0mLbrgEx6jcXWwxqateEXhuDH
   5DqJRgILZ1oUj+gEqRJorVg15w8I+dkpVUiRBrvxjuT8JjuM8DOEUomGu
   a+4RjwPmSlOJLHNOifTwq/i9n9pD+MXSnkl//15vSSR0+XPFvslw+BEe5
   T/nPhEzAjqMt+Uyk5Kgao24q6lIph4c69wgZydpSCNKqh1jSZH/PlyQU9
   42hmB+9swUea33LFUY+NtNkghBkHi5A/kex0Xx8VgrC0mhsyODnQQATg+
   sOu0sajuPMLlNFZNoVtd0sGbqJNXhlgsylz5RXChfX05iCh9kG7apeQJh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260181"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260181"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498072"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:59 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 09/15] ASoC: SOF: topology: dynamically allocate and store DAI widget->private
Date: Tue, 13 Feb 2024 12:12:41 +0200
Message-ID: <20240213101247.28887-10-peter.ujfalusi@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For dspless mode, we need to allocate and store an 'sdai'
structure. The existing code allocate the data on the stack and does
not set the widget->private pointer.

This minor change should not have any impact on existing DAIs, even
when the DSP is used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c |  8 +++-----
 sound/soc/sof/topology.c  | 13 ++++++++++---
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 9163975c9c3f..e693dcb475e4 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -46,7 +46,6 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_pipeline *spipe = swidget->spipe;
-	struct snd_sof_widget *pipe_widget;
 	int err = 0;
 	int ret;
 
@@ -59,8 +58,6 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 	if (--swidget->use_count)
 		return 0;
 
-	pipe_widget = swidget->spipe->pipe_widget;
-
 	/* reset route setup status for all routes that contain this widget */
 	sof_reset_route_setup_status(sdev, swidget);
 
@@ -109,8 +106,9 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 	 * free the scheduler widget (same as pipe_widget) associated with the current swidget.
 	 * skip for static pipelines
 	 */
-	if (swidget->dynamic_pipeline_widget && swidget->id != snd_soc_dapm_scheduler) {
-		ret = sof_widget_free_unlocked(sdev, pipe_widget);
+	if (swidget->spipe && swidget->dynamic_pipeline_widget &&
+	    swidget->id != snd_soc_dapm_scheduler) {
+		ret = sof_widget_free_unlocked(sdev, swidget->spipe->pipe_widget);
 		if (ret < 0 && !err)
 			err = ret;
 	}
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 25fb0d1443b6..915c2e88e32b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2356,23 +2356,29 @@ static int sof_dspless_widget_ready(struct snd_soc_component *scomp, int index,
 	if (WIDGET_IS_DAI(w->id)) {
 		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 		struct snd_sof_widget *swidget;
-		struct snd_sof_dai dai;
+		struct snd_sof_dai *sdai;
 		int ret;
 
 		swidget = kzalloc(sizeof(*swidget), GFP_KERNEL);
 		if (!swidget)
 			return -ENOMEM;
 
-		memset(&dai, 0, sizeof(dai));
+		sdai = kzalloc(sizeof(*sdai), GFP_KERNEL);
+		if (!sdai) {
+			kfree(swidget);
+			return -ENOMEM;
+		}
 
-		ret = sof_connect_dai_widget(scomp, w, tw, &dai);
+		ret = sof_connect_dai_widget(scomp, w, tw, sdai);
 		if (ret) {
 			kfree(swidget);
+			kfree(sdai);
 			return ret;
 		}
 
 		swidget->scomp = scomp;
 		swidget->widget = w;
+		swidget->private = sdai;
 		mutex_init(&swidget->setup_mutex);
 		w->dobj.private = swidget;
 		list_add(&swidget->list, &sdev->widget_list);
@@ -2396,6 +2402,7 @@ static int sof_dspless_widget_unload(struct snd_soc_component *scomp,
 
 		/* remove and free swidget object */
 		list_del(&swidget->list);
+		kfree(swidget->private);
 		kfree(swidget);
 	}
 
-- 
2.43.0

