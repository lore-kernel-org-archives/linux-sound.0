Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F647225A4E
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834076; cv=none; b=AvmVu5LGzrdVRQHJWOB6aR9Y+cn1BC9qNaewIOGwuZSA032bG0sKcjPErZokkEqkT1KXK1I3zH0FRshbtlq6bjYhezrGFHfleQminbqct9dRDoKHT0riUGqTgHWJV0sXQj/ahuzoPjWEI8sgDOGciKy5ZkGm65YXYCJgnT6oPNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834076; c=relaxed/simple;
	bh=LZ+9MHSEo/c/wgU/cdn7W6s6Ta09YK0Yha6uKUVXw+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C81IwQdT2FH/t3OQqIs+v1Ul5Rr0omZ84qgYwZRNu8c/59HR7zqbbbxSvnrL/sxdAgdbd1EEkScbVRdPkTClHaZcGKEs2nUXMx2ErYbE3xFE9PFAz//YXKzCrnRV+hbnTx2rLudYYEKNw/NMAozGDIOigcpbx5Nfr9gO/jzKvQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TarRq3Ek; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TarRq3Ek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738834075; x=1770370075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LZ+9MHSEo/c/wgU/cdn7W6s6Ta09YK0Yha6uKUVXw+A=;
  b=TarRq3Ekxtl6dZWHf2QW2y7wmojZDljUAFnpbLpUNslld8yZvqi9ZLYL
   6GQcairXKF+13ZgXEB4gDgJi06AnoedvGdS4zh/xFxTXOuwJUqmi5vZAd
   dPkBVDj6O4fYROu8xZY5CGEsegDjm7S1G8trtci8kklhqJcNmRzgWru/A
   xuA+hZWSAHmZU5SSCo7ymM+lAnWgXD9lV6ynm1nVTmAlytfURffJdBTOm
   gwJf3hWCIsFuPH0STbZHCVDbH8dtgoWFlzqhTNIMKujig73JoHCO351b6
   anV/LAOx8fo+6I0GpspMDrUCkvqHLNDlrR2dtMO5s1JEd4BOnw+8DViG9
   g==;
X-CSE-ConnectionGUID: U2m1bGxfTNedkFJhezozMQ==
X-CSE-MsgGUID: AYVsjaUsSgOggRGJCbM8eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43090009"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43090009"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:27:55 -0800
X-CSE-ConnectionGUID: PKveCIrrSPGLvBoC3vAD+w==
X-CSE-MsgGUID: d4nK9qJERxCVsKyotrjobw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148361980"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:27:52 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 1/4] ASoC: SOF: Relocate and rework functionality for PCM stream freeing
Date: Thu,  6 Feb 2025 11:28:25 +0200
Message-ID: <20250206092828.7569-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
References: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the sof_pcm_stream_free() from sof-audio.c to pcm.c as static function
and add wrapper to free all active stream, which is going to be used in
ipc3/4 topology code (removes duplicated code).

With this change most of the PCM stream related code is located in one
source file for easier lookup and simplified flow.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 20 ++-------
 sound/soc/sof/ipc4-topology.c | 18 +-------
 sound/soc/sof/pcm.c           | 78 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.c     | 49 ----------------------
 sound/soc/sof/sof-audio.h     |  3 +-
 5 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index e98b53b67d12..473d416bc910 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2386,28 +2386,16 @@ static int sof_ipc3_set_up_all_pipelines(struct snd_sof_dev *sdev, bool verify)
 static int sof_tear_down_left_over_pipelines(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_widget *swidget;
-	struct snd_sof_pcm *spcm;
-	int dir, ret;
+	int ret;
 
 	/*
 	 * free all PCMs and their associated DAPM widgets if their connected DAPM widget
 	 * list is not NULL. This should only be true for paused streams at this point.
 	 * This is equivalent to the handling of FE DAI suspend trigger for running streams.
 	 */
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		for_each_pcm_streams(dir) {
-			struct snd_pcm_substream *substream = spcm->stream[dir].substream;
-
-			if (!substream || !substream->runtime || spcm->stream[dir].suspend_ignored)
-				continue;
-
-			if (spcm->stream[dir].list) {
-				ret = sof_pcm_stream_free(sdev, substream, spcm, dir, true);
-				if (ret < 0)
-					return ret;
-			}
-		}
-	}
+	ret = sof_pcm_free_all_streams(sdev);
+	if (ret)
+		return ret;
 
 	/*
 	 * free any left over DAI widgets. This is equivalent to the handling of suspend trigger
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index c04c62478827..21e29bfd4b22 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3401,9 +3401,6 @@ static int sof_ipc4_dai_get_param(struct snd_sof_dev *sdev, struct snd_sof_dai *
 
 static int sof_ipc4_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verify)
 {
-	struct snd_sof_pcm *spcm;
-	int dir, ret;
-
 	/*
 	 * This function is called during system suspend, we need to make sure
 	 * that all streams have been freed up.
@@ -3415,21 +3412,8 @@ static int sof_ipc4_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 	 *
 	 * This will also make sure that paused streams handled correctly.
 	 */
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		for_each_pcm_streams(dir) {
-			struct snd_pcm_substream *substream = spcm->stream[dir].substream;
-
-			if (!substream || !substream->runtime || spcm->stream[dir].suspend_ignored)
-				continue;
 
-			if (spcm->stream[dir].list) {
-				ret = sof_pcm_stream_free(sdev, substream, spcm, dir, true);
-				if (ret < 0)
-					return ret;
-			}
-		}
-	}
-	return 0;
+	return sof_pcm_free_all_streams(sdev);
 }
 
 static int sof_ipc4_link_setup(struct snd_sof_dev *sdev, struct snd_soc_dai_link *link)
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 35a7462d8b69..709baa1b0bd6 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -191,6 +191,84 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static int sof_pcm_stream_free(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       struct snd_sof_pcm *spcm, int dir,
+			       bool free_widget_list)
+{
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
+	int ret;
+	int err = 0;
+
+	if (spcm->prepared[substream->stream]) {
+		/* stop DMA first if needed */
+		if (pcm_ops && pcm_ops->platform_stop_during_hw_free)
+			snd_sof_pcm_platform_trigger(sdev, substream,
+						     SNDRV_PCM_TRIGGER_STOP);
+
+		/* free PCM in the DSP */
+		if (pcm_ops && pcm_ops->hw_free) {
+			ret = pcm_ops->hw_free(sdev->component, substream);
+			if (ret < 0) {
+				dev_err(sdev->dev, "%s: pcm_ops hw_free failed %d\n",
+					__func__, ret);
+				err = ret;
+			}
+		}
+
+		spcm->prepared[substream->stream] = false;
+		spcm->pending_stop[substream->stream] = false;
+	}
+
+	/* reset the DMA */
+	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: platform hw free failed %d\n",
+			__func__, ret);
+		if (!err)
+			err = ret;
+	}
+
+	/* free widget list */
+	if (free_widget_list) {
+		ret = sof_widget_list_free(sdev, spcm, dir);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: sof_widget_list_free failed %d\n",
+				__func__, ret);
+			if (!err)
+				err = ret;
+		}
+	}
+
+	return err;
+}
+
+int sof_pcm_free_all_streams(struct snd_sof_dev *sdev)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_sof_pcm *spcm;
+	int dir, ret;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		for_each_pcm_streams(dir) {
+			substream = spcm->stream[dir].substream;
+
+			if (!substream || !substream->runtime ||
+			    spcm->stream[dir].suspend_ignored)
+				continue;
+
+			if (spcm->stream[dir].list) {
+				ret = sof_pcm_stream_free(sdev, substream, spcm,
+							  dir, true);
+				if (ret < 0)
+					return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int sof_pcm_hw_free(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 9a52781bf8d8..a9664b4cf43f 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -829,55 +829,6 @@ bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev)
 	return false;
 }
 
-int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
-			struct snd_sof_pcm *spcm, int dir, bool free_widget_list)
-{
-	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
-	int ret;
-	int err = 0;
-
-	if (spcm->prepared[substream->stream]) {
-		/* stop DMA first if needed */
-		if (pcm_ops && pcm_ops->platform_stop_during_hw_free)
-			snd_sof_pcm_platform_trigger(sdev, substream, SNDRV_PCM_TRIGGER_STOP);
-
-		/* free PCM in the DSP */
-		if (pcm_ops && pcm_ops->hw_free) {
-			ret = pcm_ops->hw_free(sdev->component, substream);
-			if (ret < 0) {
-				dev_err(sdev->dev, "%s: pcm_ops hw_free failed %d\n",
-					__func__, ret);
-				err = ret;
-			}
-		}
-
-		spcm->prepared[substream->stream] = false;
-		spcm->pending_stop[substream->stream] = false;
-	}
-
-	/* reset the DMA */
-	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-	if (ret < 0) {
-		dev_err(sdev->dev, "%s: platform hw free failed %d\n",
-			__func__, ret);
-		if (!err)
-			err = ret;
-	}
-
-	/* free widget list */
-	if (free_widget_list) {
-		ret = sof_widget_list_free(sdev, spcm, dir);
-		if (ret < 0) {
-			dev_err(sdev->dev, "%s: sof_widget_list_free failed %d\n",
-				__func__, ret);
-			if (!err)
-				err = ret;
-		}
-	}
-
-	return err;
-}
-
 /*
  * Generic object lookup APIs.
  */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 62f3c11a9216..7d4810924682 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -649,8 +649,7 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev *sdev,
 			 struct snd_sof_pcm *spcm);
-int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
-			struct snd_sof_pcm *spcm, int dir, bool free_widget_list);
+int sof_pcm_free_all_streams(struct snd_sof_dev *sdev);
 int get_token_u32(void *elem, void *object, u32 offset);
 int get_token_u16(void *elem, void *object, u32 offset);
 int get_token_comp_format(void *elem, void *object, u32 offset);
-- 
2.48.1

