Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337702F549C
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285312; cv=none; b=q1E5yS8KcWdrz+twVyyQUqLHtH49RQ3S+dsTEG/UEZWL5VElcBBaXrBRLIY1kyhjD/9prQNwE4y8PLDdS+szPXFGc2XlfTZj5KNIaWCkwdTWQFHIWyMM5Uzny2uddjboio3zyOdAKRQv+VNyHrusc9UVLUQJk7lUjcZbM/+pvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285312; c=relaxed/simple;
	bh=NIPRY9ruN+wTeldCfrZYfaYY/2pQ/03Seoc0u5+J0OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox52Iw9gJPIXXY2C5v9sxMt/0x6M5dorrefL+og86KtpNQD31pqhMmKBeizkPXigvA41ZR6BXRjOL40lGG5touQKfJ4mER/itTKBphSE3W1q1JNvvRtKuVByz4JcewdFzq/Xi153UjFpPDipBGahEXvQTPHqoCImYgBr+XhUoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cc3rxfn6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cc3rxfn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779285312; x=1810821312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NIPRY9ruN+wTeldCfrZYfaYY/2pQ/03Seoc0u5+J0OQ=;
  b=Cc3rxfn6MfrOO5ZACh+9u4gLgmAWYTL+iYIwgP6MefAeNlnOhu6T61mZ
   n+A/XuZiFganHp5eBpqdgvkOL0fVt+WDIkUrPQUDzNTo8gAvaJ7CpSEWs
   2W8f7tR0+s76K33GtgC9qWmSZpybfRauNlY2OYSu/QF9dGWp8jw1vnMEt
   GV9VsF82EAHeW/BHTy8tsL4tkEJ+vGWsMzR0y5y3ht6xkUuON2PFk9sBj
   H3GBjK+nk/V/N/Zw4SaQrwUSCQmiks4jK4Ez2rFReSbhN6IRLT3Mh24Vk
   wVKTKO2/0OJL9v9PUSp1lBKXS+hnAkXL7vrrUp490ugpvuZUSayV0iA98
   A==;
X-CSE-ConnectionGUID: cpggGbJ1SxOOZeue1L0JNw==
X-CSE-MsgGUID: hfnLPH+4QiuQFjP1FpPwnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83800403"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="83800403"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:55:11 -0700
X-CSE-ConnectionGUID: ZlKwV6JHS6uafxCjZaq6dg==
X-CSE-MsgGUID: KVECpRpIQTmd5VFBMXpkDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235757717"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:55:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/2] ASoC: SOF: Validate and correct the core id against the number of cores of the DSP
Date: Wed, 20 May 2026 16:55:14 +0300
Message-ID: <20260520135514.32720-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135514.32720-1-peter.ujfalusi@linux.intel.com>
References: <20260520135514.32720-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generic development topologies can reference core id outside of the range
of the number of DSP cores the device might have.
Product families have different number of cores, for example:
Intel TGL has 4, TGL-H has 2, ADL has 4, ADL-S has 2, etc
The development topologies are tuned for the higher end devices and in this
case they will fail on DSP with less number of cores.

Override the out of range core id from topology to primary core and inform
the user about it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 10 +++++++++-
 sound/soc/sof/ipc4-topology.c | 10 +++++++++-
 sound/soc/sof/topology.c      |  9 ++++++++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 8006777f2f64..4e066bbded91 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -519,6 +519,7 @@ static int sof_ipc3_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_sof_pipeline *spipe = swidget->spipe;
 	struct sof_ipc_pipe_new *pipeline;
 	struct snd_sof_widget *comp_swidget;
@@ -559,8 +560,15 @@ static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	if (ret < 0)
 		goto err;
 
-	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE))
+	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE)) {
+		pipeline->core = SOF_DSP_PRIMARY_CORE;
+	} else if (pipeline->core > sdev->num_cores - 1) {
+		dev_info(scomp->dev,
+			 "out of range core id for %s, moving it %d -> %d\n",
+			 swidget->widget->name, pipeline->core,
+			 SOF_DSP_PRIMARY_CORE);
 		pipeline->core = SOF_DSP_PRIMARY_CORE;
+	}
 
 	if (sof_debug_check_flag(SOF_DBG_DYNAMIC_PIPELINES_OVERRIDE))
 		swidget->dynamic_pipeline_widget =
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 94851ad809fc..e32cf4dee091 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -927,6 +927,7 @@ static void sof_ipc4_widget_free_comp_dai(struct snd_sof_widget *swidget)
 static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_pipeline *pipeline;
 	struct snd_sof_pipeline *spipe = swidget->spipe;
 	int ret;
@@ -942,8 +943,15 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 		goto err;
 	}
 
-	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE))
+	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE)) {
+		pipeline->core_id = SOF_DSP_PRIMARY_CORE;
+	} else if (pipeline->core_id > sdev->num_cores - 1) {
+		dev_info(scomp->dev,
+			 "out of range core id for %s, moving it %d -> %d\n",
+			 swidget->widget->name, pipeline->core_id,
+			 SOF_DSP_PRIMARY_CORE);
 		pipeline->core_id = SOF_DSP_PRIMARY_CORE;
+	}
 
 	swidget->core = pipeline->core_id;
 	spipe->core_mask |= BIT(pipeline->core_id);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 87b539916b4a..8fc7726aec29 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1574,8 +1574,15 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		int core = sof_get_token_value(SOF_TKN_COMP_CORE_ID, swidget->tuples,
 					       swidget->num_tuples);
 
-		if (core >= 0)
+		if (core >= 0) {
+			if (core > sdev->num_cores - 1) {
+				dev_info(scomp->dev,
+					 "out of range core id for %s, moving it %d -> %d\n",
+					 swidget->widget->name, core, SOF_DSP_PRIMARY_CORE);
+				core = SOF_DSP_PRIMARY_CORE;
+			}
 			swidget->core = core;
+		}
 	}
 
 	/* bind widget to external event */
-- 
2.54.0

