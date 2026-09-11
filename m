Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE29468C05
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125746; cv=none; b=SW3CAr/6aLrThA5m823UQl1AqyFE30SG8mkRrZdFEFwqoMPu2X7hEO4hnU8EynTHMguV8Zsy2d5+oS8iJp9IZRwjj9Gj4Cq0GULoGVFpP+mqw0XIbq39M3eihOogfju/kBmFlQJWTISTSm7tsce9792bZov5O0zLHH4e1yRFvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125746; c=relaxed/simple;
	bh=tBK9SM3RSA/rEz/fLqEJVVH3e++0o89vjl5wdJ3ue1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbSZ9JfCmDpCBmq9Ly526KhaW1oZe6A1oGBzhfF/NeCCHdOPkiH9Sjemid6BVRTTSc7WUQKlro6NoCEP536kVkyhpifdU0hqJrdd1AzWfbHWR0V4EhvXL4bjXaozVJXvp1D8fH4+cN7mwCzK+gPbL0iKYSmHB1EBvRxMS3+ObAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FD7hKaYA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FD7hKaYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125732; x=1820661732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tBK9SM3RSA/rEz/fLqEJVVH3e++0o89vjl5wdJ3ue1w=;
  b=FD7hKaYASOiwbX42qLUboIHMHMtsu6zTbqPPkefPKWMMW+PZJrVIC479
   iexDPyY6zdTCk82g3qAd4XdIPKruPDKJBxnsKeDqJdukSrvE0JvzzRC4a
   hdXHkwVKCH5oeWra3Qp5u7qlCq7hxl4f4bYDXqakvzKMmUbYeTJvb8sY6
   jMpfLEmm/rNmvGBm+9Ie11dB+4T737eg/LwHTyxZ+gzKKErwMyHgoaPTA
   EPbt6GBHEbyQE4STedNwVDbfmamKUQyylpp4tZPZTmfXJF0eMci4pNdPf
   Sptmf/DOFnBWnHVhoiYLbzKaqvb5gAdzjUzuJLq1mL9YBnnuf8XvnImbD
   Q==;
X-CSE-ConnectionGUID: mDNZ0yIaQEylC+NV/234Vg==
X-CSE-MsgGUID: 2X2MlJxkTVGxri6En7p8gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749927"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749927"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:05 -0700
X-CSE-ConnectionGUID: ejBlSQNrQD+7lAi+NnshhA==
X-CSE-MsgGUID: 2djy54OvTVWPA459RS+nig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213276"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:03 -0700
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
Subject: [PATCH v3 07/26] ASoC: SOF: compress: Move the IPC agnostic helpers to sof-audio.c
Date: Fri, 11 Sep 2026 14:21:33 +0300
Message-ID: <20260911112152.28528-8-peter.ujfalusi@linux.intel.com>
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

The fragment elapsed handling and the page table creation in compress.c
are not tied to the IPC version, they will be used by both the IPC3 and
the upcoming IPC4 compressed implementation.

Move them to sof-audio.c and export create_page_table() as
snd_sof_compr_create_page_table().

No functional change.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/compress.c  | 82 +--------------------------------------
 sound/soc/sof/sof-audio.c | 81 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h |  3 ++
 3 files changed, 85 insertions(+), 81 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 93f2376585db..76d03faaafc4 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -12,86 +12,6 @@
 #include "sof-utils.h"
 #include "ops.h"
 
-static void sof_set_transferred_bytes(struct sof_compr_stream *sstream,
-				      u64 host_pos, u64 buffer_size)
-{
-	u64 prev_pos;
-	unsigned int copied;
-
-	div64_u64_rem(sstream->copied_total, buffer_size, &prev_pos);
-
-	if (host_pos < prev_pos)
-		copied = (buffer_size - prev_pos) + host_pos;
-	else
-		copied = host_pos - prev_pos;
-
-	sstream->copied_total += copied;
-}
-
-static void snd_sof_compr_fragment_elapsed_work(struct work_struct *work)
-{
-	struct snd_sof_pcm_stream *sps =
-		container_of(work, struct snd_sof_pcm_stream,
-			     period_elapsed_work);
-
-	snd_compr_fragment_elapsed(sps->cstream);
-}
-
-void snd_sof_compr_init_elapsed_work(struct work_struct *work)
-{
-	INIT_WORK(work, snd_sof_compr_fragment_elapsed_work);
-}
-
-/*
- * sof compr fragment elapse, this could be called in irq thread context
- */
-void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
-{
-	struct snd_soc_pcm_runtime *rtd;
-	struct snd_compr_runtime *crtd;
-	struct snd_soc_component *component;
-	struct sof_compr_stream *sstream;
-	struct snd_sof_pcm *spcm;
-
-	if (!cstream)
-		return;
-
-	rtd = cstream->private_data;
-	crtd = cstream->runtime;
-	sstream = crtd->private_data;
-	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
-
-	spcm = snd_sof_find_spcm_dai(component, rtd);
-	if (!spcm) {
-		dev_err(component->dev,
-			"fragment elapsed called for unknown stream!\n");
-		return;
-	}
-
-	sof_set_transferred_bytes(sstream, spcm->stream[cstream->direction].posn.host_posn,
-				  crtd->buffer_size);
-
-	/* use the same workqueue-based solution as for PCM, cf. snd_sof_pcm_elapsed */
-	schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
-}
-
-static int create_page_table(struct snd_soc_component *component,
-			     struct snd_compr_stream *cstream,
-			     unsigned char *dma_area, size_t size)
-{
-	struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
-	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	int dir = cstream->direction;
-	struct snd_sof_pcm *spcm;
-
-	spcm = snd_sof_find_spcm_dai(component, rtd);
-	if (!spcm)
-		return -EINVAL;
-
-	return snd_sof_create_page_table(component->dev, dmab,
-					 spcm->stream[dir].page_table.area, size);
-}
-
 static int sof_compr_open(struct snd_soc_component *component,
 			  struct snd_compr_stream *cstream)
 {
@@ -213,7 +133,7 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	if (ret < 0)
 		goto out;
 
-	ret = create_page_table(component, cstream, crtd->dma_area, crtd->dma_bytes);
+	ret = snd_sof_compr_create_page_table(component, cstream, crtd->dma_area, crtd->dma_bytes);
 	if (ret < 0)
 		goto out;
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 72ff03b0b80d..d244e90a734b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -11,6 +11,7 @@
 #include <linux/bitfield.h>
 #include <trace/events/sof.h>
 #include "sof-audio.h"
+#include "sof-utils.h"
 #include "ops.h"
 
 /*
@@ -1050,3 +1051,83 @@ int sof_dai_get_tdm_slots(struct snd_soc_pcm_runtime *rtd)
 	return sof_dai_get_param(rtd, SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS);
 }
 EXPORT_SYMBOL(sof_dai_get_tdm_slots);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+static void sof_set_transferred_bytes(struct sof_compr_stream *sstream,
+				      u64 host_pos, u64 buffer_size)
+{
+	u64 prev_pos;
+	unsigned int copied;
+
+	div64_u64_rem(sstream->copied_total, buffer_size, &prev_pos);
+
+	if (host_pos < prev_pos)
+		copied = (buffer_size - prev_pos) + host_pos;
+	else
+		copied = host_pos - prev_pos;
+
+	sstream->copied_total += copied;
+}
+
+static void snd_sof_compr_fragment_elapsed_work(struct work_struct *work)
+{
+	struct snd_sof_pcm_stream *sps = container_of(work, struct snd_sof_pcm_stream,
+						      period_elapsed_work);
+
+	snd_compr_fragment_elapsed(sps->cstream);
+}
+
+void snd_sof_compr_init_elapsed_work(struct work_struct *work)
+{
+	INIT_WORK(work, snd_sof_compr_fragment_elapsed_work);
+}
+
+/*
+ * sof compr fragment elapse, this could be called in irq thread context
+ */
+void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_compr_runtime *crtd;
+	struct snd_soc_component *component;
+	struct sof_compr_stream *sstream;
+	struct snd_sof_pcm *spcm;
+
+	if (!cstream)
+		return;
+
+	rtd = cstream->private_data;
+	crtd = cstream->runtime;
+	sstream = crtd->private_data;
+	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm) {
+		dev_err(component->dev, "fragment elapsed called for unknown stream!\n");
+		return;
+	}
+
+	sof_set_transferred_bytes(sstream, spcm->stream[cstream->direction].posn.host_posn,
+				  crtd->buffer_size);
+
+	/* use the same workqueue-based solution as for PCM, cf. snd_sof_pcm_elapsed */
+	schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
+}
+
+int snd_sof_compr_create_page_table(struct snd_soc_component *component,
+				    struct snd_compr_stream *cstream,
+				    unsigned char *dma_area, size_t size)
+{
+	struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	int dir = cstream->direction;
+	struct snd_sof_pcm *spcm;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	return snd_sof_create_page_table(component->dev, dmab,
+					 spcm->stream[dir].page_table.area, size);
+}
+#endif
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index ae95efc9be1c..c09099f30378 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -660,6 +660,9 @@ void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
 void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream);
 void snd_sof_compr_init_elapsed_work(struct work_struct *work);
+int snd_sof_compr_create_page_table(struct snd_soc_component *component,
+				    struct snd_compr_stream *cstream,
+				    unsigned char *dma_area, size_t size);
 #else
 static inline void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream) { }
 static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
-- 
2.55.0

