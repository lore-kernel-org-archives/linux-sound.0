Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F48564A
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712660450; cv=none; b=ofqcl3E2GWDKCHKXH22wju41guruC79AgBD1HgQ6N8q3r9Qcp+jnYWMYf+tLG5A+YbkiPATSkrtHDzCgaDHBzWLc40qid7brLOBUhEdxenDvQdHCXf3aF8FoiAv6amwHtbi/p3oe8rNXOC+H6VXP/11ON7PLR86EHapFRNChxmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712660450; c=relaxed/simple;
	bh=LdZzr318QrhbXPxu6mBGSuicgp2heuXrnpHng+bm9KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQKEcT/weUfLxGER52PRAKFw+w6RTX4rtEJY4omh97Qxq+uBDU/GzgGST/jAYFf0k3ElKYiqCkx7ag9egAPJja0AOkx9xQHN1MbPA3DO6YersFOAb+9MzEqluMEzc+/Dn5h/Y8g07pFmmWnV7N+H56fyw1MthwqqwLfy/46d+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9pHlyzR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9pHlyzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712660449; x=1744196449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LdZzr318QrhbXPxu6mBGSuicgp2heuXrnpHng+bm9KU=;
  b=f9pHlyzRvO67EicBe0tY5hfYv+DDJFyU5f/CiPGdCO8AOic1C+gax5UA
   r/IrXizU3Dl2Hpq7c8SpMMN7bH94PDGeU16N7cm0CtSMLrIFPTMgfkm3x
   /xrEuOyDNgtAAKd9Itad4VuQGAvvzq+kVX1lvPlUjOpmqPu3PR5098QyP
   7Li/hw9rYVDmB23fzBxW+bAbgernLQI3BqqTnfHKRiTRd7OJpbaYerhc0
   yvUzbqTaDpDtuUKELRe3ftGhP4JlIEk2n1mc/4Q7EjpoLL9/pXRFiG9kV
   Bce0ohvxYviq4TgvCtUo0B6+mNvkpQGR3CTe6nlE9fBKprkDvuqSQ3KoI
   g==;
X-CSE-ConnectionGUID: qFgvRqDeSIi7gQuRTzAtMg==
X-CSE-MsgGUID: /cK3PM0JTH2oCFHyGWWeCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7813026"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7813026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:49 -0700
X-CSE-ConnectionGUID: ggCHYw9ITwiH2497UmMsIw==
X-CSE-MsgGUID: R3bwEb4LRLCFSxBQj+u4uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20309786"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 4/4] ASoC: SOF: ipc4-pcm: Do not reset the ChainDMA if it has not been allocated
Date: Tue,  9 Apr 2024 14:00:36 +0300
Message-ID: <20240409110036.9411-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409110036.9411-1-peter.ujfalusi@linux.intel.com>
References: <20240409110036.9411-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ChainDMA operation differs from normal pipelines that it is only
created when the stream started, in fact a PCM using ChainDMA has no
pipelines, modules.
To reset a ChainDMA, it needs to be first allocated in firmware. When
PulseAudio/PipeWire starts, they will probe the PCMs by opening them, check
hw_params and then close the PCM without starting audio.
Unconditionally resetting the ChainDMA can result the following error:

ipc tx      : 0xe040000|0x0: GLB_CHAIN_DMA
ipc tx reply: 0x2e000007|0x0: GLB_CHAIN_DMA
FW reported error: 7 - Unsupported operation requested
ipc error for msg 0xe040000|0x0
sof_pcm_stream_free: pcm_ops hw_free failed -22

Add a new chain_dma_allocated flag to sof_ipc4_pcm_stream_priv to store the
ChainDMA allocation state and use this flag to skip sending the reset if
the ChainDMA is not allocated.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 34ce6bb7f37d..4594470ed08b 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -40,9 +40,12 @@ struct sof_ipc4_timestamp_info {
 /**
  * struct sof_ipc4_pcm_stream_priv - IPC4 specific private data
  * @time_info: pointer to time info struct if it is supported, otherwise NULL
+ * @chain_dma_allocated: indicates the ChainDMA allocation state
  */
 struct sof_ipc4_pcm_stream_priv {
 	struct sof_ipc4_timestamp_info *time_info;
+
+	bool chain_dma_allocated;
 };
 
 static inline struct sof_ipc4_timestamp_info *
@@ -269,14 +272,17 @@ sof_ipc4_update_pipeline_state(struct snd_sof_dev *sdev, int state, int cmd,
  */
 
 static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
-				      int direction,
+				      struct snd_sof_pcm *spcm, int direction,
 				      struct snd_sof_pcm_stream_pipeline_list *pipeline_list,
 				      int state, int cmd)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_pcm_stream_priv *stream_priv;
 	bool allocate, enable, set_fifo_size;
 	struct sof_ipc4_msg msg = {{ 0 }};
-	int i;
+	int ret, i;
+
+	stream_priv = spcm->stream[direction].private;
 
 	switch (state) {
 	case SOF_IPC4_PIPE_RUNNING: /* Allocate and start chained dma */
@@ -297,6 +303,11 @@ static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
 		set_fifo_size = false;
 		break;
 	case SOF_IPC4_PIPE_RESET: /* Disable and free chained DMA. */
+
+		/* ChainDMA can only be reset if it has been allocated */
+		if (!stream_priv->chain_dma_allocated)
+			return 0;
+
 		allocate = false;
 		enable = false;
 		set_fifo_size = false;
@@ -354,7 +365,12 @@ static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
 	if (enable)
 		msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_ENABLE_MASK;
 
-	return sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
+	/* Update the ChainDMA allocation state */
+	if (!ret)
+		stream_priv->chain_dma_allocated = allocate;
+
+	return ret;
 }
 
 static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
@@ -394,7 +410,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	 * trigger function that handles the rest for the substream.
 	 */
 	if (pipeline->use_chain_dma)
-		return sof_ipc4_chain_dma_trigger(sdev, substream->stream,
+		return sof_ipc4_chain_dma_trigger(sdev, spcm, substream->stream,
 						  pipeline_list, state, cmd);
 
 	/* allocate memory for the pipeline data */
-- 
2.44.0

