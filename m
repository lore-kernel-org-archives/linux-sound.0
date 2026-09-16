Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5939792A
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560231; cv=none; b=A7Fmxs5ypx9LvUVJVGNROnCiRZ4Yz2nAiBTaBthoI3kU+HVHA9oZNobb7AXydDHcdQ/PYA+EHa9LNdV5WNgiKd863t5tdhzSGRtTaKcw2EeWR/SBcqDGfmcwlwW5VqEKhYb/3pvfmLLb8mvJUNhl7xqVUaqymTPE1z5BB2dtxf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560231; c=relaxed/simple;
	bh=tBK9SM3RSA/rEz/fLqEJVVH3e++0o89vjl5wdJ3ue1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZCGz68NohLXplVoBDLrfgPN5dhC6nGoHMmiZHX/oB/Qqwz0ZDua2CxSe8xC3YnSjmEiIHhTViv11REtT9CItofduuWVayC9cupYewbMwnTMehdbH01v5hrwlr/UKPNm0PXFiCr1HiK9EUSUEX6uGIMp4MP2UwxwyEyVUNImuwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkh77FO2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkh77FO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560226; x=1821096226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tBK9SM3RSA/rEz/fLqEJVVH3e++0o89vjl5wdJ3ue1w=;
  b=gkh77FO2/5WxDEa9YMHHIYfFqomK+rxeWamUB6gnYlnBTtSsK7eKU7Uj
   ebz7x8S3e6I6+5922BAu+9llTsiQwBe3J1HBn0OsTzwlI4ysvgE5bpaJZ
   nJfNCtUG153ZVAT++ZqfAhQjA9Ii20/mn2EeOwCGLMmcqcMiM2+VWPVVe
   P6PKjqebuMxGLsLr5n9POcCfexP6jNe+pfHKXqYzaKHmcuvkcLgAQ83NH
   T6yOT+Mvqiac1Nkg8/qXFtdqN5NErngrwmszOzLPnl9lXLQEk3asaRbQ4
   HCBR2ri+xxarY5MjMvylu6mt2i/fTK8STPHLn4qDTBv8Kde9Mhb3lxoq2
   w==;
X-CSE-ConnectionGUID: zM1dYeayS0iDwK61T0f/Qw==
X-CSE-MsgGUID: 4lQkysfSQeGR343HEUWumw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496292"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496292"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:33 -0700
X-CSE-ConnectionGUID: mWpdCs05S2+u3g1nNcNEpQ==
X-CSE-MsgGUID: HbTB4f28T7eidxTuFn9Q7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293370"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:30 -0700
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
Subject: [PATCH v4 07/26] ASoC: SOF: compress: Move the IPC agnostic helpers to sof-audio.c
Date: Wed, 16 Sep 2026 15:03:01 +0300
Message-ID: <20260916120320.18318-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
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

