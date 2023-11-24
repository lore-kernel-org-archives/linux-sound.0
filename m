Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5Sy2VgP"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C911987
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 05:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700834237; x=1732370237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FvYHkoenAEk3M3JkzclDAQ0Pw1n/6evwoowS3fCCIRg=;
  b=K5Sy2VgP7/AYW5H3n4zz85wyUDutpckYOh92wVt7SKS8sMgSKTG0/jXD
   9UiGIoNYBPNx0fCgsATzuFJIDjCVekhYtwvUfmhxfwoQgtvz1LRz48SE7
   LpqtIrv1+7e0R1MIAkxviNUZhmrqTl2jD8VHH90hxJFvCjehmjHju1YbK
   bHBjrnaHolzEpsYDTbdgwcMvr0MIealMaakgPKF0Fne6pvTM1QHz+bKa9
   PmW6Nwr5ELH6C3vfMzY1NnkrTV3C5IJ52y9JEZvlQqNPGauoUtms8hJ/y
   6v6H5YuVrpMlrLNjivvgiYG9QhZWTXrYkQJzkJERRD7yUbB1i4MEyDQrb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372590370"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="372590370"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:57:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858397229"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="858397229"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:57:14 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: sof-audio: Modify logic for enabling/disabling topology cores
Date: Fri, 24 Nov 2023 15:57:43 +0200
Message-ID: <20231124135743.24674-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
References: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In the current code, we enable a widget core when it is set up and
disable it when it is freed. This is problematic with IPC4 because
widget free is essentially a NOP and all widgets are freed in the
firmware when the pipeline is deleted. This results in a crash during
pipeline deletion when one of it's widgets is scheduled to run on a
secondary core and is powered off when widget is freed. So, change the
logic to enable all cores needed by all the modules in a pipeline when
the pipeline widget is set up and disable them after the pipeline
widget is freed.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 65 ++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 563fe6f7789f..77cc64ac7113 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -46,6 +46,7 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 				    struct snd_sof_widget *swidget)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	struct snd_sof_widget *pipe_widget;
 	int err = 0;
 	int ret;
@@ -87,15 +88,22 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 	}
 
 	/*
-	 * disable widget core. continue to route setup status and complete flag
-	 * even if this fails and return the appropriate error
+	 * decrement ref count for cores associated with all modules in the pipeline and clear
+	 * the complete flag
 	 */
-	ret = snd_sof_dsp_core_put(sdev, swidget->core);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to disable target core: %d for widget %s\n",
-			swidget->core, swidget->widget->name);
-		if (!err)
-			err = ret;
+	if (swidget->id == snd_soc_dapm_scheduler) {
+		int i;
+
+		for_each_set_bit(i, &spipe->core_mask, sdev->num_cores) {
+			ret = snd_sof_dsp_core_put(sdev, i);
+			if (ret < 0) {
+				dev_err(sdev->dev, "failed to disable target core: %d for pipeline %s\n",
+					i, swidget->widget->name);
+				if (!err)
+					err = ret;
+			}
+		}
+		swidget->spipe->complete = 0;
 	}
 
 	/*
@@ -108,10 +116,6 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 			err = ret;
 	}
 
-	/* clear pipeline complete */
-	if (swidget->id == snd_soc_dapm_scheduler)
-		swidget->spipe->complete = 0;
-
 	if (!err)
 		dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
 
@@ -134,8 +138,10 @@ static int sof_widget_setup_unlocked(struct snd_sof_dev *sdev,
 				     struct snd_sof_widget *swidget)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	bool use_count_decremented = false;
 	int ret;
+	int i;
 
 	/* skip if there is no private data */
 	if (!swidget->private)
@@ -166,19 +172,23 @@ static int sof_widget_setup_unlocked(struct snd_sof_dev *sdev,
 			goto use_count_dec;
 	}
 
-	/* enable widget core */
-	ret = snd_sof_dsp_core_get(sdev, swidget->core);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to enable target core for widget %s\n",
-			swidget->widget->name);
-		goto pipe_widget_free;
+	/* update ref count for cores associated with all modules in the pipeline */
+	if (swidget->id == snd_soc_dapm_scheduler) {
+		for_each_set_bit(i, &spipe->core_mask, sdev->num_cores) {
+			ret = snd_sof_dsp_core_get(sdev, i);
+			if (ret < 0) {
+				dev_err(sdev->dev, "failed to enable target core %d for pipeline %s\n",
+					i, swidget->widget->name);
+				goto pipe_widget_free;
+			}
+		}
 	}
 
 	/* setup widget in the DSP */
 	if (tplg_ops && tplg_ops->widget_setup) {
 		ret = tplg_ops->widget_setup(sdev, swidget);
 		if (ret < 0)
-			goto core_put;
+			goto pipe_widget_free;
 	}
 
 	/* send config for DAI components */
@@ -208,15 +218,22 @@ static int sof_widget_setup_unlocked(struct snd_sof_dev *sdev,
 	return 0;
 
 widget_free:
-	/* widget use_count and core ref_count will both be decremented by sof_widget_free() */
+	/* widget use_count will be decremented by sof_widget_free() */
 	sof_widget_free_unlocked(sdev, swidget);
 	use_count_decremented = true;
-core_put:
-	if (!use_count_decremented)
-		snd_sof_dsp_core_put(sdev, swidget->core);
 pipe_widget_free:
-	if (swidget->id != snd_soc_dapm_scheduler)
+	if (swidget->id != snd_soc_dapm_scheduler) {
 		sof_widget_free_unlocked(sdev, swidget->spipe->pipe_widget);
+	} else {
+		int j;
+
+		/* decrement ref count for all cores that were updated previously */
+		for_each_set_bit(j, &spipe->core_mask, sdev->num_cores) {
+			if (j >= i)
+				break;
+			snd_sof_dsp_core_put(sdev, j);
+		}
+	}
 use_count_dec:
 	if (!use_count_decremented)
 		swidget->use_count--;
-- 
2.42.1

