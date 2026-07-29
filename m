Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB449471D15
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322647; cv=none; b=H5xd+p+rbKcUZYkIwnTrytRUCGtrnaubClmyXuZyFnDqh+XXv5WPJfRr61SlJd50lExPkTx7p84W4rnbRkakQV0J5fg3D79VxS1VtnxuAQnYU3FfvPTcp3PTy91hPxUVI5Ctjjv1oOPg9QfDADRaMhoxif1japxcQijrdZKMvwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322647; c=relaxed/simple;
	bh=aLUdAHdqHtJZeCylBkHG2NUfyB+40znt2CI0wWyE+cw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRuTx5fmGF9orFyO2VSrh/P5TA0jiEIfEphN+L+MjCMdj+pbvbuVIbjm4eEjxwdrULQ2NBXGayBwcoJKK7OodxzsW0M9Z8Jm2pMzlnrThycABcoMjrPsOkpx4Flueb5keUO8p8h4GMPKWFk72DqdkRVXAbdPlOJf5ND+aGhMeR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jov0nwVf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jov0nwVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322646; x=1816858646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aLUdAHdqHtJZeCylBkHG2NUfyB+40znt2CI0wWyE+cw=;
  b=Jov0nwVfkJMi5PIHlNVJZ4sceIkz8s3hQ8IAHWJ6RGyrspoVRRm6vVsN
   UpcTcDxukNXffWNz6pDh9RlFRYOX7rvGp83hu8kq7nTXx42zur3NLbURZ
   iyLPf/lrgVZolJfYszRVZvBtVkuN7ddM4/p5GK/1lJjn+NgqLAyB3gZnN
   J9uvg511E5bwuFF0TYTEp/E1ks82wYjmq1my2b6HHILyw3jnZd2dasVR3
   xs28GnrB9++hVJt7CokkosuerkFQFpONFvpleCYwbW+Z+wghM7OigUqm5
   qyYjUFn3yzt9lEJOLPQZBvCTrauk4PmUAZE1AFpEfByzXWlnUwhOt91/N
   g==;
X-CSE-ConnectionGUID: wgNsHpbnTQu/HfZMnjUtKg==
X-CSE-MsgGUID: 3emkkJtdRFOtVSZyo+nI4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583864"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:25 -0700
X-CSE-ConnectionGUID: OstauWbTSJapv/AL5J1KPg==
X-CSE-MsgGUID: MwcSajH1QzWn0gjqijh/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255675992"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 7/8] ASoC: Intel: catpt: Streamline runtime-variables naming
Date: Wed, 29 Jul 2026 13:00:56 +0200
Message-Id: <20260729110057.342447-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729110057.342447-1-cezary.rojewski@intel.com>
References: <20260729110057.342447-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mimic naming pattern commonly found in the ASoC code:

- 'rtd' in case of struct snd_soc_pcm_runtime
- 'runtime' in case of struct snd_pcm_runtime

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 42 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 8fb0efb67eb1..12a5226cf12c 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -75,8 +75,8 @@ static struct catpt_stream_template *catpt_topology[] = {
 static struct catpt_stream_template *
 catpt_get_stream_template(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtm, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	enum catpt_stream_type type;
 
 	type = cpu_dai->driver->id;
@@ -159,11 +159,11 @@ static void catpt_stream_read_position(struct catpt_dev *cdev,
 static void catpt_arrange_page_table(struct snd_pcm_substream *substream,
 				     struct snd_dma_buffer *pgtbl)
 {
-	struct snd_pcm_runtime *rtm = substream->runtime;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dma_buffer *databuf = snd_pcm_get_dma_buf(substream);
 	int i, pages;
 
-	pages = snd_sgbuf_aligned_pages(rtm->dma_bytes);
+	pages = snd_sgbuf_aligned_pages(runtime->dma_bytes);
 
 	for (i = 0; i < pages; i++) {
 		u32 pfn, offset;
@@ -386,7 +386,7 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_pcm_runtime *rtm = substream->runtime;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dma_buffer *dmab;
 	struct catpt_stream_runtime *stream;
 	struct catpt_audio_format afmt;
@@ -412,8 +412,8 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 
 	memset(&rinfo, 0, sizeof(rinfo));
 	rinfo.page_table_addr = stream->pgtbl.addr;
-	rinfo.num_pages = DIV_ROUND_UP(rtm->dma_bytes, PAGE_SIZE);
-	rinfo.size = rtm->dma_bytes;
+	rinfo.num_pages = DIV_ROUND_UP(runtime->dma_bytes, PAGE_SIZE);
+	rinfo.size = runtime->dma_bytes;
 	rinfo.offset = 0;
 	rinfo.ring_first_page_pfn = PFN_DOWN(snd_sgbuf_get_addr(dmab, 0));
 
@@ -544,11 +544,11 @@ void catpt_stream_update_position(struct catpt_dev *cdev,
 				  struct catpt_notify_position *pos)
 {
 	struct snd_pcm_substream *substream = stream->substream;
-	struct snd_pcm_runtime *r = substream->runtime;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_uframes_t dsppos, newpos;
 	int ret;
 
-	dsppos = bytes_to_frames(r, pos->stream_position);
+	dsppos = bytes_to_frames(runtime, pos->stream_position);
 
 	if (!stream->prepared)
 		goto exit;
@@ -556,8 +556,8 @@ void catpt_stream_update_position(struct catpt_dev *cdev,
 	if (stream->template->type != CATPT_STRM_TYPE_RENDER)
 		goto exit;
 
-	if (dsppos >= r->buffer_size / 2)
-		newpos = r->buffer_size / 2;
+	if (dsppos >= runtime->buffer_size / 2)
+		newpos = runtime->buffer_size / 2;
 	else
 		newpos = 0;
 	/*
@@ -565,7 +565,7 @@ void catpt_stream_update_position(struct catpt_dev *cdev,
 	 * (buffer half consumed) update wp to allow stream progression.
 	 */
 	ret = catpt_ipc_set_write_pos(cdev, stream->info.stream_hw_id,
-				      frames_to_bytes(r, newpos),
+				      frames_to_bytes(runtime, newpos),
 				      false, false);
 	if (ret) {
 		dev_err(cdev->dev, "update position for stream %d failed: %d\n",
@@ -600,11 +600,11 @@ static const struct snd_pcm_hardware catpt_pcm_hardware = {
 };
 
 static int catpt_component_pcm_new(struct snd_soc_component *component,
-				   struct snd_soc_pcm_runtime *rtm)
+				   struct snd_soc_pcm_runtime *rtd)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 
-	snd_pcm_set_managed_buffer_all(rtm->pcm, SNDRV_DMA_TYPE_DEV_SG,
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV_SG,
 				       cdev->dev,
 				       catpt_pcm_hardware.buffer_bytes_max,
 				       catpt_pcm_hardware.buffer_bytes_max);
@@ -615,9 +615,9 @@ static int catpt_component_pcm_new(struct snd_soc_component *component,
 static int catpt_component_open(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
-	if (!rtm->dai_link->no_pcm)
+	if (!rtd->dai_link->no_pcm)
 		snd_soc_set_runtime_hwparams(substream, &catpt_pcm_hardware);
 	return 0;
 }
@@ -626,13 +626,13 @@ static snd_pcm_uframes_t
 catpt_component_pointer(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtm, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct catpt_stream_runtime *stream;
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	u32 pos;
 
-	if (rtm->dai_link->no_pcm)
+	if (rtd->dai_link->no_pcm)
 		return 0;
 
 	stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
@@ -650,10 +650,10 @@ static const struct snd_soc_dai_ops catpt_fe_dai_ops = {
 	.trigger = catpt_dai_trigger,
 };
 
-static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
+static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtd,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtm, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct catpt_ssp_device_format devfmt;
 	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	int ret;
-- 
2.34.1

